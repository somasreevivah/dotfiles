#!/bin/bash
#######################################################################
#          SCRIPT TO INSTALL SOME VIM PLUGINS AUTOMATICALLY           #
#######################################################################


################
#  PARAMETERS  #
################

VIMRC="$HOME/.vimrc"
VIM_FOLDER="$HOME/.vim"
VIM_INSTALL_FOLDER="$VIM_FOLDER/bundle"
PLUGIN_INSTALLED=""


##########################
#  FUNCTION DEFINITIONS  #
##########################


begin_install() {
  installing $plug_name
  if test -d $VIM_INSTALL_FOLDER/$folder_name; then
    already_installed $plug_name
    PLUGIN_INSTALLED="True"
  else
    PLUGIN_INSTALLED=""
  fi
}

check_brew(){
  if which brew
  then
    echo "Brew detected"
  else
    echo "Brew not detected, install it, go to http://brew.sh"
    echo "Install it running:"
    echo 'ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
    read -p "Press any key to continue, or get out with Ctrl-C"
  fi
}

installing(){
  echo -e "\n\n====> \033[1;34m INSTALLING $1 \033[0m <===="
}

already_installed(){
  echo -e "\t---> Package $1 already installed \n\t\t(erase the files in $VIM_INSTALL_FOLDER/ to trigger the installation)"
}

add_plugin_to_vimrc(){
  if test -n "$1"; then
    link=$1
  else
    link=$plug_name
  fi
  echo "Adding plugin $link to .vimrc"
  cp $VIMRC $VIMRC.tmp
  cat $VIMRC | perl -pe "s/(.*vundle#begin.*)/\1\nPlugin \'$link\'/g" > $VIMRC.tmp
  mv $VIMRC.tmp $VIMRC
}

check_for_plugin_in_vimrc(){
  if test -n "$1"; then
    link=$1
  else
    link=$plug_name
  fi
  if grep $link $VIMRC; then
    echo -e "Plugin information found in $VIMRC file"
  else
    echo -e " \033[4;31mError:: Plugin information for $link not found in $VIMRC file... Add it, I could do it myself but I decided it was not a good idea...\033[0m "
    echo -e "\t\t\t Just add \033[0;96mPlugin '$plug_name'\033[0m to your .vimrc"
    exit 1
  fi
}

install_with_vundle(){
  echo "Calling Vundle installation routine for $plug_name"
  vim -u "$HOME/.vim/etc/vundle_dummy.vim" +"PluginInstall $plug_name" +qall
}

recognise_os () {
  if [ "$(uname)" == "Darwin"  ]
  then
    __MAC__="TRUE"
    echo "We are on a MAC, yeah"
    echo "We use brew for some stuff.. Maybe you should uninstall MacPorts and Fink if they are on the system, I am no exper but I think brew is way better than those... anyways"
    echo "Checking for HomeBrew.."
    check_brew
  else
    __LINUX__="TRUE"
  fi
}

###########################################
#  RECOGNISE OPERATING SYSTEM             #
###########################################

recognise_os



###########################################
#  CONTROL OF VIM FOLDERS AND CONF FILES  #
###########################################

# CONTROL OF DIRECTORIES
if test -d $VIM_FOLDER
then
  echo "Folder .vim detected..."
  if test -d $VIM_INSTALL_FOLDER
  then
    echo "Folder $VIM_INSTALL_FOLDER detected..."
  else
    echo "Folder $VIM_INSTALL_FOLDER not detected... Creating it"
    mkdir $VIM_INSTALL_FOLDER
  fi
else
  echo "Creating .vim folder..."
  mkdir $VIM_FOLDER
fi


####################################
#  INSTALL PACKAGE MANAGER VUNDLE  #
####################################

VUNDLE_URL="https://github.com/VundleVim/Vundle.vim"
installing Vundle.vim
if test -e $VIM_INSTALL_FOLDER/Vundle.vim
then
  already_installed Vundle.vim
else
  echo "Vundle.vim not detected"
  echo "Getting Vundle from $VUNDLE_URL"
  git clone $VUNDLE_URL $VIM_INSTALL_FOLDER/Vundle.vim
  install_with_vundle
fi


####################
##  YouCompleteMe  #
####################

#YCM_URL="https://github.com/Valloric/YouCompleteMe"
#installing YouCompleteMe
#if [ $__MAC__ ]
#then
#echo "We need MacVim"
#if [ $(which mvim) ]
#then
#echo "MacVim (mvim) detected..."
#else
#echo "MacVim (mvim) not detected... Installing it"
#brew install MacVim
#fi
#fi

#if test -e $VIM_INSTALL_FOLDER/YouCompleteMe
#then
#already_installed YouCompleteMe
#else
#echo "YouCompleteMe not detected, getting it from $YCM_URL"
#git clone $YCM_URL $VIM_INSTALL_FOLDER/YouCompleteMe
#cd $VIM_INSTALL_FOLDER/YouCompleteMe
#git submodule update --init --recursive
#python install.py --clang-completer
#cd ~
#check_for_plugin_in_vimrc "Valloric/YouCompleteMe"
#install_with_vundle

#fi



##############
#  NerdTree  #
##############

folder_name="nerdtree"
plug_name="scrooloose/nerdtree"
begin_install
if test -z "$PLUGIN_INSTALLED"; then
  check_for_plugin_in_vimrc
  install_with_vundle
fi

##############
#  AIRLINE   #
##############

folder_name="vim-airline"
plug_name="bling/vim-airline"
begin_install
if test -z "$PLUGIN_INSTALLED"; then
  check_for_plugin_in_vimrc
  install_with_vundle
fi

#AIRLINE THEMES

folder_name="vim-airline-themes"
plug_name="vim-airline/vim-airline-themes"
begin_install
if test -z "$PLUGIN_INSTALLED"; then
  check_for_plugin_in_vimrc
  install_with_vundle
fi

########################################
#  Install Emmet for vim (html stuff)  #
########################################

folder_name="emmet-vim"
plug_name="mattn/emmet-vim"
begin_install
if test -z "$PLUGIN_INSTALLED"; then
  check_for_plugin_in_vimrc $plug_name
  install_with_vundle
fi



#######################
#  INSTALL UltiSnips  #
#######################

folder_name="ultisnips"
plug_name="SirVer/ultisnips"
begin_install
if test -z "$PLUGIN_INSTALLED"; then
  # UltiSnips needs at least vim 7.4.x to work
  # check it
  if vim --version | grep 7.4
  then
    check_for_plugin_in_vimrc
    install_with_vundle
  else
    echo "UltiSnips (the nice program for autocompleting code) needs at least vim 7.4 to work"
    echo "It is anyways a good idea to install a newer vim version"
    read -p "Press any key to continue... "
  fi
fi


##################
#  VIM-SNIPPETS  #
##################

folder_name="vim-snippets"
plug_name='honza/vim-snippets'
begin_install
if test -z "$PLUGIN_INSTALLED"; then
  check_for_plugin_in_vimrc
  install_with_vundle
fi


################################
#  NERDCOMMENTER INSTALLATION  #
################################

folder_name="nerdcommenter"
plug_name="scrooloose/nerdcommenter"
begin_install
if test -z "$PLUGIN_INSTALLED"; then
  check_for_plugin_in_vimrc
  install_with_vundle
fi



##################
#  BUFFEXPLORER  #
##################

folder_name="bufexplorer"
plug_name="jlanzarotta/bufexplorer"
begin_install
if test -z "$PLUGIN_INSTALLED"; then
  check_for_plugin_in_vimrc
  install_with_vundle
fi


##############
#  SuperTab  #
##############

folder_name="supertab"
plug_name="ervandew/supertab"
begin_install
if test -z "$PLUGIN_INSTALLED"; then
  check_for_plugin_in_vimrc
  install_with_vundle
fi

#################
#  NeoComplete  #
#################

folder_name="neocomplete.vim"
plug_name="Shougo/neocomplete.vim"
begin_install
if test -z "$PLUGIN_INSTALLED"; then
  # Neocomplete needs vim with lua support
  # We have to Test it !
  if vim --version | grep +lua
  then
    check_for_plugin_in_vimrc
    install_with_vundle
  else
    echo "$folder_name needs vim compiled with lua, and your vim version does not have it. (check vim --version for flags)"
    if test -n "$__MAC__"
    then
      echo -e 'Try removing your vim with \n\t brew uninstall vim'
      echo -e 'Install vim with lua:\n\t brew install vim --with-lua'
    else
      echo "The packages vim-nox, vim-gtk, vim-gnome and vim-athena are built with lua dependencies"
    fi
    read -p "Press any key to continue... "
  fi
fi

####################
#  VIM-TABLE-MODE  #
####################

folder_name="vim-table-mode"
plug_name="dhruvasagar/vim-table-mode"
begin_install
if test -z "$PLUGIN_INSTALLED"; then
  check_for_plugin_in_vimrc
  install_with_vundle
fi


##############
#  VASP.VIM  #
##############

folder_name="vasp.vim"
plug_name="alejandrogallo/vasp.vim"
begin_install
if test -z "$PLUGIN_INSTALLED"; then
  check_for_plugin_in_vimrc
  install_with_vundle
fi

##############
#  VASP.VIM  #
##############

folder_name="vim-asymptote"
plug_name="alejandrogallo/vim-asymptote"
begin_install
if test -z "$PLUGIN_INSTALLED"; then
  check_for_plugin_in_vimrc
  install_with_vundle
fi

################
##  COMMAND T  #
################

#folder_name="command-t"
#plug_name="wincent/command-t"
#begin_install
#if test -z "$PLUGIN_INSTALLED"; then
  #if vim --version | grep +ruby; then
    #check_for_plugin_in_vimrc
    #install_with_vundle
    ##command t must be compiled
    #echo "Changing to $plug_name directory to compile files"
    #cd $VIM_INSTALL_FOLDER/$folder_name/ruby/command-t
    #ruby extconf.rb && make
    #cd -
  #else
    ##Command t needs vim compiled with ruby support
    #echo "Command-t needs ruby support for vim, check it with ( vim --version | grep ruby)"
    #read -p "Press any key to continue... "
  #fi
#fi

############
#  CTRL P  #
############

folder_name="ctrlp.vim"
plug_name="ctrlpvim/ctrlp.vim"
begin_install
if test -z "$PLUGIN_INSTALLED"; then
  check_for_plugin_in_vimrc
  install_with_vundle
fi

##################
#  vim-surround  #
##################

folder_name="vim-surround"
plug_name="tpope/vim-surround"
begin_install
if test -z "$PLUGIN_INSTALLED"; then
  check_for_plugin_in_vimrc
  install_with_vundle
fi


###############
#  SYNTASTIC  #
###############

folder_name="syntastic"
plug_name="scrooloose/syntastic"
begin_install
if test -z "$PLUGIN_INSTALLED"; then
  check_for_plugin_in_vimrc
  install_with_vundle
fi

###################
#  Color-schemes  #
###################

folder_name="vim-colorschemes"
plug_name="flazz/vim-colorschemes"
begin_install
if test -z "$PLUGIN_INSTALLED"; then
  check_for_plugin_in_vimrc
  install_with_vundle
fi


#############
#  GNUPLOT  #
#############

folder_name="gnuplot.vim"
plug_name="vim-scripts/gnuplot.vim"
begin_install
if test -z "$PLUGIN_INSTALLED"; then
  check_for_plugin_in_vimrc
  install_with_vundle
fi


########################
#  vim-fugitive (GIT)  #
########################

folder_name="vim-fugitive"
plug_name="tpope/vim-fugitive"
begin_install
if test -z "$PLUGIN_INSTALLED"; then
  check_for_plugin_in_vimrc
  install_with_vundle
fi


#################
#  vim tabular  #
#################

folder_name="tabular"
plug_name="godlygeek/tabular"
begin_install
if test -z "$PLUGIN_INSTALLED"; then
  check_for_plugin_in_vimrc
  install_with_vundle
fi



############
#  tagbar  #
############

folder_name="tagbar"
plug_name="majutsushi/tagbar"
begin_install
if test -z "$PLUGIN_INSTALLED"; then
  check_for_plugin_in_vimrc
  install_with_vundle
fi

#################
#  vim angular  #
#################

folder_name="vim-angular"
plug_name= 'burnettk/vim-angular'
begin_install
if test -z "$PLUGIN_INSTALLED"; then
  check_for_plugin_in_vimrc
  install_with_vundle
fi

##################
#  vim hardtime  #
##################
#practice not using jjjj and so

folder_name="vim-hardtime"
plug_name= 'takac/vim-hardtime'
begin_install
if test -z "$PLUGIN_INSTALLED"; then
  check_for_plugin_in_vimrc
  install_with_vundle
fi

#################
#  easy motion  #
#################


folder_name="vim-easymotion"
plug_name= 'easymotion/vim-easymotion'
begin_install
if test -z "$PLUGIN_INSTALLED"; then
  check_for_plugin_in_vimrc
  install_with_vundle
fi

#############
#  FSwitch  #
#############



folder_name="fswitch"
plug_name= 'derekwyatt/vim-fswitch'
begin_install
if test -z "$PLUGIN_INSTALLED"; then
  check_for_plugin_in_vimrc
  install_with_vundle
fi

