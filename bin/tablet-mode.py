#! /usr/bin/env python3
# -*- coding: utf-8 -*-
import gi
gi.require_version('Gtk', '3.0')
from gi.repository import Gtk
from gi.repository import Gdk
import pickle
import random
import os

buttons = [
    {
        "label": "Rotate left",
        "pressed": lambda e: os.system(
            "~/.dotfiles/bin/rotate-screen.sh left"
        ),
    },
    {
        "label": "Rotate right",
        "pressed": lambda e: os.system(
            "~/.dotfiles/bin/rotate-screen.sh right"
        ),
    },
    {
        "label": "Rotate inverted",
        "pressed": lambda e: os.system(
            "~/.dotfiles/bin/rotate-screen.sh inverted"
        ),
    },
    {
        "label": "Sleep",
        "pressed": lambda e: os.system(
            "systemctl hybrid-sleep"
        ),
    },
    {
        "label": "Quit",
        "pressed": lambda e: Gtk.main_quit(),
    },
]

class Quiz:
    def __init__(self):
        self.main_window = Gtk.Window()
        self.main_window.connect("delete-event", Gtk.main_quit)
        self.main_window.set_decorated(False)
        self.main_window.set_title("TabletModeWidget")
        self.main_window.connect("key-press-event", self.handle_key)
        self.main_window.set_opacity(0.4)
        self.screen = self.main_window.get_screen()

        Hbox = Gtk.VBox()
        self.definition_label = Gtk.Label()
        self.buttons = []
        for button in buttons:
            self.buttons.append(
                Gtk.Button(
                    button.get('label'),
                )
            )
            for ev in ["pressed", "activate", "clicked", "enter", "leave",
                    "released"]:
                if ev in button.keys():
                    self.buttons[-1].connect(ev, button.get(ev))
            Hbox.add(self.buttons[-1])


        self.main_window.add(Hbox)

        self.main_window.show_all()
        self.main_window.move(0,0)
        self.main_window.resize(
            self.main_window.get_size()[0],
            self.screen.get_height()
        )
        Gtk.main()

    def handle_key(self, w, el):
        self.main_window.move(0, 0)
        print(el.get_keycode())
        print(el.get_keyval())
        print(el.string)
        # Space
        if el.get_keycode()[1] == 65:
            pass
        # n
        elif el.get_keycode()[1] == 57:
            pass
        # q
        elif el.get_keycode()[1] == 24:
            Gtk.main_quit()


if __name__ == "__main__":
    app = Quiz()
