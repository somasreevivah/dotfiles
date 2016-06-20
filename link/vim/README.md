# DOTVIM #

This is my .vim folder. There are many like it, but this one is mine.
My .vim folder is my best friend. It is my life. I must master it as I must master my life.

My .vim folder, without me, is useless. Without my .vim folder, I am useless. I must fire my .vim folder true. I must shoot straighter than my enemy who is trying to kill me. I must shoot him before he shoots me. I will...

My .vim folder and I know that what counts in war is not the rounds we fire, the noise of our burst, nor the smoke we make. We know that it is the hits that count. We will hit...

My .vim folder is human, even as I, because it is my life. Thus, I will learn it as a brother. I will learn its weaknesses, its strength, its parts, its accessories, its sights and its barrel. I will keep my .vim folder clean and ready, even as I am clean and ready. We will become part of each other. We will...
Before God, I swear this creed. My .vim folder and I are the defenders of my country. We are the masters of our enemy. We are the saviors of my life.
So be it, until victory is America's and there is no enemy, but peace!


# Main usage #

Here I describe my approach to source control my vim configuration. 
I use the package manager [Vundle.vim](https://github.com/VundleVim/Vundle.vim) because it has explicit function to install, search and update plugins.

You clone it or fork it by doing

```bash
git clone https://github.com/alejandrogallo/dotvim.git ~/.vim
```


make sure to backup your *.vim* directory and your *.vimrc* file first.

After that you can just type `make init` to initialise everything.
The first thing this will do is to trigger the `./bin/link-vimrc.sh` bash script, which links your `~/.vimrc` file to the repository
file found at `./etc/vimrc`.

In the `vimrc` file there are the plugins listed in the *Vundle.vim* way. Since to install some plugins
sometimes you have to install third party programs or compile some code, *Vundle.vim* does not handle yet such 
particular issues, so I made a script to trigger the installation of all plugins, which is found in
`./bin/install-plugins.sh`. So to install a plugin you have to

1. Add the plugin to your `.vimrc` file (which is linked to `./etc/vimrc`)
2. Add the install trigger to the `bin/install-plugins.sh` script to tailor the behaviour of the installation of the plugin.

# Snippets #

Checkout my snippets in `UltiSnips` folder.
