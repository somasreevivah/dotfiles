#! /usr/bin/env python2
# -*- coding: utf-8 -*-

import curses
import time
import os
import re
import sys
import tempfile



def terminate(main_screen):
    """
    :returns: TODO

    """
    curses.nocbreak();
    main_screen.keypad(0);
    curses.echo()
    curses.endwin()

def init():
    """
    :returns: TODO

    """
    main_screen=curses.initscr()
    curses.noecho()
    curses.cbreak()
    curses.curs_set(0)
    return main_screen

def regexize(SEARCH):
    """TODO: Docstring for regexize.

    :SEARCH: TODO
    :returns: TODO

    """
    REGEX_SEARCH=""
    for i in range(len(SEARCH)):
        REGEX_SEARCH+=".*"+SEARCH[i]
    return REGEX_SEARCH

def print_debug(main_screen, text):
    """TODO: Docstring for print_debug.

    :main_screen: TODO
    :text: TODO
    :returns: TODO

    """
    main_screen.addstr(max_height-1,0,"Debug: "+text)


# inBufferName = tempfile.mktemp()
# inBuffer = open(inBufferName, "w+")
# inBuffer.write(sys.stdin.read())
# inBuffer.close()

lineBuffer=[]
lineBuffer = sys.stdin.readlines()

# print(lineBuffer)

sys.stdin = open("/dev/tty", "r")

# a = input("put an input")
# print(a)
# sys.exit(1)

main_screen   = init() # main window

max_height = int(main_screen.getmaxyx()[0])
buffer_height = max_height - 2

# lineBuffer    = getHistory()
# lineBuffer = open(inBufferName)


PROMPT="Pick:"
main_screen.addstr(0, 0, PROMPT, curses.A_REVERSE)
main_screen.refresh()

SEARCH=""


# keys
ESC    = 27
ENTER  = 10
Ctrl_P = 16
Ctrl_N = 14
DOWN   = curses.KEY_DOWN
UP     = curses.KEY_UP


selected_match=1
matches=[]
i=0
print_debug(main_screen,"%s"%i)
try:
    while 1:
        ++i
        time.sleep(1)
        c=32
        # c = main_screen.getch()
        # c = input("sdf")
        # print(c)

        # clean every time
        for j in range(len(matches)):
            main_screen.addstr(j+1,0," "*(len(matches[j])+2))
        main_screen.addstr(0, len(PROMPT)+1," "*len(SEARCH))
        # curses.KEY_UP
        if c==127:
            SEARCH=SEARCH[:-1]
        elif c == Ctrl_N or c == DOWN:
            selected_match= (selected_match+1) if selected_match-len(matches) else len(matches)
        elif c == Ctrl_P or c == UP:
            selected_match= (selected_match-1) if selected_match-1 else 1
        elif c == ESC: # ESC
            terminate(main_screen)
            sys.exit(0)
        elif c == ENTER: # ENTER
            # curses.flash()
            terminate(main_screen)
            os.system(matches[selected_match-1])
            sys.exit(0)
        elif 126>=c>=32:
            SEARCH+=chr(c)
        matches=[]
        main_screen.addstr(selected_match, 1,">")
        main_screen.addstr(0, len(PROMPT)+1,SEARCH)
        # print_debug(main_screen,str(c))
        print_debug(main_screen,"%s"%i)
        for j,line in enumerate(lineBuffer):
            if re.match(regexize(SEARCH),line, re.IGNORECASE):
                matches.append(line)
                main_screen.addstr(len(matches),3,line)
                if len(matches)>=buffer_height:
                    break
except:
    terminate(main_screen)
else:
    terminate(main_screen)


#vim-run: python3 % <<<"asdfsdf adsfasdf\nasdf"
#vim-run: echo -e "1\n2\n3" | python3 %
#vim-run: python3 %
