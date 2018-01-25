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
        "label": "Fullscreen",
        "pressed": lambda e: os.system('(sleep .1; i3-msg fullscreen)&'),
        "released": lambda e: os.system('i3-msg kill')
    },
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
        self.main_window.set_title("Widget")
        self.main_window.connect("key-press-event", self.handle_key)

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

        Hbox.add(Gtk.VolumeButton())

        self.main_window.add(Hbox)

        self.main_window.show_all()
        self.main_window.move(0,0)
        Gtk.main()

    def handle_key(self, w, el):
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
