
liberator.plugins.exOpen = (function() {
  var global = liberator.globalVariables.exopen_templates;
  if (!global) {
    global = [{
      label: 'vimplab',
      value: 'http://www.vimperator.org/vimperator',
      description: 'open vimperator trac page',
      newtab: true
    }, {
      label: ['gh', "github"],
      value: 'http://github.com/search?q=',
      custom: function (value, a) {
        return String(value)+String(a);
        //return "https://github.com/search?q="+a[1];
      },
      description: 'Search in github',
      newtab: true
    },];
  }

  function openTabOrSwitch(url) {
    var tabs = gBrowser.mTabs;
    for (let i=0, l=tabs.length; i<l; i++)
      if (tabs[i].linkedBrowser.contentDocument.location.href == url) return (gBrowser.tabContainer.selectedIndex = i);
    return liberator.open(url, liberator.NEW_TAB);
  }

  function replacer(str, isEscape) {
    if (!str) return '';
    var win = new XPCNativeWrapper(window.content.window);
    var sel = '', htmlsel = '';
    var selection = win.getSelection();
    function __replacer(val) {
      switch (val) {
        case '%TITLE%':
          return buffer.title;
        case '%URL%':
          return buffer.URL;
        case '%SEL%':
          if (sel) return sel;
          else if (selection.rangeCount < 1) return '';
          for (let i=0, c=selection.rangeCount; i<c;
            sel += selection.getRangeAt(i++).toString());
          return sel;
        case '%HTMLSEL%':
          if (htmlsel) return sel;
          if (selection.rangeCount < 1) return '';

          let serializer = new XMLSerializer();
          for (let i=0, c=selection.rangeCount; i<c;
            htmlsel += serializer.serializeToString(selection.getRangeAt(i++).cloneContents()));
          return htmlsel;
      }
      return '';
    }
    var _replacer = __replacer;
    if (isEscape) _replacer = function(val) escape( __replacer(val) );

    return str.replace(/%(TITLE|URL|SEL|HTMLSEL)%/g, _replacer);
  }

  var ExOpen = function() this.initialize.apply(this, arguments);
  ExOpen.prototype = {
    initialize: function() {
      this.createCompleter();
      this.registerCommand();
    },
    createCompleter: function() {
        this.completer = global.map(
          function(t) [t.label, util.escapeString((t.description ? t.description + ' - ' : '') + t.value)]
        );
    },
    registerCommand: function() {
      var self = this;
      commands.addUserCommand(['exopen'], 'Open byextension URL',
        function(args) self.open(args), {
          bang: true,
          completer: function(context, args) {
            context.title = ['Template', 'Description - Value'];
            if (!context.filter) {
              context.completions = self.completer;
              return;
            }
            var filter = context.filter.toLowerCase();
            context.completions = self.completer.filter( function( t ) t[0].toLowerCase().indexOf(filter) == 0 );
          }
      });
    },
    find: function(label) {
      var ret = null;
      global.some(function(template) (template.label == label) && (ret = template));
      return ret;
    },
    open: function(args) {
      var url = '';
      if (!args) return;
      var name = args.string;
      if (args instanceof Array) {
        name = args.shift();
        args.string = args.string.replace(new RegExp(name.replace(/(\W)/g,'\\$1')+'\\s+'),'');
      }
      var template = this.find(name) || {value: name};
      if (typeof template.custom == 'function') {
        url = template.custom.call(this, template.value, args);
      } else if (template.custom instanceof Array) {
        url = replacer(template.value).replace(template.custom[0], template.custom[1], template.escape);
      } else {
        url = replacer(template.value, template.escape);
      }
      if (!url) return;
      if (template.newtab || args.bang) openTabOrSwitch(url);
      else liberator.open(url);
    },
  };
  return new ExOpen();
})();
