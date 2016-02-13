
# DOTFILES #

These   are    my   dotfiles,    I   got   a    lot   of    stuff   from
[here](https://github.com/cowboy/dotfiles), it  remains to see if  it is
reallz useful.

Information about the order of scripts sourcing
-----------------------------------------------

For  Bash, they  work  as  follows. Read  down  the appropriate  column.
Executes A, then B,  then C, etc. The B1, B2, B3  means it executes only
the first of those files found.


Table 1 : For bash.
[Source](https://shreevatsa.wordpress.com/2008/03/30/zshbash-startup-files-loading-order-bashrc-zshrc-etc/)

|                  | Interactive login | Interactive non-login | Script |
| ---------------- | ----------------- | --------------------- | ------ |
| /etc/profile     | A                 |                       |        |
| /etc/bash.bashrc |                   | A                     |        |
| ~/.bashrc        |                   | B                     |        |
| ~/.bash_profile  | B1                |                       |        |
| ~/.bash_login    | B2                |                       |        |
| ~/.profile       | B3                |                       |        |
| BASH_ENV         |                   |                       | A      |
| ~/.bash_logout   | C                 |                       |        |




Table 2: For zsh.

| Files            | Interactive login  | Interactive non-login  | Script |
| ---------------- | ------------------ | ---------------------- | ------ |
| /etc/zshenv      | A                  | A                      | A      |
| ~/.zshenv        | B                  | B                      | B      |
| /etc/zprofile    | C                  |                        |        |
| ~/.zprofile      | D                  |                        |        |
| /etc/zshrc       | E                  | C                      |        |
| ~/.zshrc         | F                  | D                      |        |
| /etc/zlogin      | G                  |                        |        |
| ~/.zlogin        | H                  |                        |        |
| ~/.zlogout       | I                  |                        |        |
| /etc/zlogout     | J                  |                        |        |
