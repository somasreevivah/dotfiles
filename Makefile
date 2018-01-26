.PHONY: init

init:
	./bin/dfs
	./bin/dfs sub
	vim +PlugInstall
