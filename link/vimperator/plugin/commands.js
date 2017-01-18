
function opener_concat(template, args) {

  if (args.length === 0) {
    liberator.echo('input a query!');
    return false;
  }
  // make "and" query
  var query = args.join("+");
  liberator.execute(":open "+template+query);
  return false;
}

(function () {

  liberator.modules.commands.addUserCommand(
    ["vasp"],
    "Vasp wiki searcher",
    function(args){
      return opener_concat("http://cms.mpi.univie.ac.at/wiki/index.php?title=Special:Search&go=Go&search=", args);
    },
    {},
    true
  );

  liberator.modules.commands.addUserCommand(
    ["youtube"],
    "Youtube Searcher",
    function(args){
      return opener_concat("https://www.youtube.com/results?search_query=", args);
    },
    {},
    true
  );

})();
