#! /usr/bin/env python3
# -*- coding: utf-8 -*-

import gi
gi.require_version('Gtk', '3.0')
from gi.repository import Gtk

class Main:
    def __init__(self):
        self.window = Gtk.Window()

        self.window.connect("delete-event", Gtk.main_quit)
        self.window.set_decorated(False)
        self.window.set_title("Control panel")

        self.window.show_all()


if __name__ == "__main__":
    Main()
    Gtk.main()
