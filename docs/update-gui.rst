Guide to put console only or graphical only
===========================================

http://ask.xmodulo.com/boot-into-command-line-ubuntu-debian.html

Boot into Command-line Permanently
If you want to boot into command-line permanently, you need to update GRUB configuration which defines kernel booting parameters.

Open a default GRUB config file with a text editor.

$ sudo vi /etc/default/grub
Look for a line that starts with GRUB_CMDLINE_LINUX_DEFAULT, and comment out that line by prepending # sign. This will disable the initial splash screen, and enable verbose mode (i.e., showing the detailed booting procedure).

Then change GRUB_CMDLINE_LINUX="" to:

GRUB_CMDLINE_LINUX="text"

Next, uncomment the line that says "#GRUB_TERMINAL=console".

The updated GRUB defult configuration looks like the following.

Now use update-grub command to re-generate a GRUB2 config file in /boot based on these changes.

$ sudo update-grub
For systemd-enabled desktop only: If your desktop uses systemd (e.g., for Debian 8 or later or Ubuntu 15.04 or later), there is one additional step needed. That is to change the default target from "graphical" target to "multi-user" target. Skip this step if your desktop does not use systemd.

$ sudo systemctl set-default multi-user.target
You can always revert to desktop boot later by restoring GRUB config file and running:

$ sudo systemctl set-default graphical.target
At this point, your desktop should boot into the command line when you reboot it.
