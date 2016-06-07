
commands.add(["invert","inv"],
    "Invert colors of website",
    function (args) {
      var DOCUMENT=window.content.window.document;
      var color=args||"white";
      var properties={ 
        "color":"white",
        "background-color":"black",
        "border-color":"green"
      };
      var propertiesBack=undefined;

      var tags = DOCUMENT.getElementsByTagName("*");
      if (tags[0].propertiesBack) {
        //alert("Getting properties back");
        for (var i = 0, len = tags.length; i < len; i++) {
          tags[i].style          = tags[i].propertiesBack;
          tags[i].propertiesBack = undefined;
        }
      }
      else {
        //alert("Setting properties");
        for (var i = 0, len = tags.length; i < len; i++) {
          for (var prop in properties) {
            tags[i].propertiesBack=tags[i].style;
            tags[i].style.setProperty(prop ,  properties[prop] );
          }
        }
      }
    });
