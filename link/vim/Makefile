CONFIGURATION_FILES=vimrc

init:  link-config-files install-plugins

install-plugins:
	./bin/install-plugins.sh

purge-local:
	rm -rf ~/.vim/bundle/*
	echo "" > ~/.vimrc

list:
	./bin/list-plugins.sh

link-config-files:
	./bin/link.sh $(CONFIGURATION_FILES)

reset-all: purge-local all

update-plugins:
	vim +PluginUpdate
update-submodules:
	git submodule update
init-submodules:
	git submodule init

push-changes:
	git commit -am "Normal update"
	git push origin master

update-snippets:
	@if ! test -d $(HOME)/.vim/UltiSnips; then \
		mkdir $(HOME)/.vim/UltiSnips; \
		cd $(HOME)/.vim/UltiSnips; \
		git clone https://alejandrogallo@github.com/alejandrogallo/vim-snippets UltiSnips; \
	else \
		git pull; \
	fi
	cd -

profile-vim:
	vim --cmd 'profile start profile.log' \
		--cmd 'profile func *' \
		--cmd 'profile file *' \
		-c 'profdel func *' \
		-c 'profdel file *' \
		-c 'qa!'

