

var inspectorID = "inspector@mozilla.org";
init();

function init(){

/* これやるとFirefox終了時に実行されるんだけど...なぜ？ -> Ubiquityが悪さしているみたい
Object.prototype.inspect = function(){
  runInspector(this);
};
*/

function runInspector(node){
  if (node instanceof Document){
    inspectDOMDocument(node);
  } else if (node instanceof Node){
    inspectDOMNode(node);
  } else if (node !== null && typeof node != "undefined"){
    inspectObject(node);
  }
}

function getIDList(filter, isChrome){
  var doc = isChrome ? document : content.document;
  var iter = util.evaluateXPath('//*[@id and contains(@id,"' + filter + '")]',doc);
  var arr = [];
  for (let e in iter) arr.push(e);
  return arr.map(e => ["#" + e.id, "TagName: "+ e.tagName]);
}

var options = [
  [["-frame","-f"], commands.OPTION_NOARG]
];
commands.add(["inspect","dominspect"],"run DOM Inspector",
  function(args){
    var arg = args[0];
    var doc = args.bang ? document : content.document;
    var node;
    if (!arg){
      node = doc;
    } else if (arg.charAt(0) == "#"){
      let id = arg.substr(1);
      node = doc.getElementById(id);
      if (!node){
        liberator.echoerr("No such id: " + id );
        return;
      }
    } else {
      try {
        node = liberator.eval(args.string);
      } catch (e){
        liberator.echoerr(e);
      }
    }
    if (args["-frame"] && node.contentDocument) node = node.contentDocument;
    runInspector(node);
  },{
    bang: true,
    argCount: "*",
    options: options,
    completer: function(context, args){
      if (args[0] && args[0].charAt(0) == "#"){
        var arg = args[0];
        var list = getIDList(arg.substr(1), args.bang);
        context.completions = list.filter(function(elem) elem[0].indexOf(arg) == 0);
      } else {
        completion.javascript(context);
      }
    }
  }
);

}

// vim: sw=2 ts=2 et:
