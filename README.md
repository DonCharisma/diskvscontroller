# diskvscontroller
A way to list all hard disks on linux system, and see which controller they are attached to

Do feel free to modify, use, distribute however you wish

However, you do so accepting that :

No liability WHATSOEVER rests with me in you using

I'll only take credit for when it works, thanks !

diskvscontroller.script.sh
--------------------------

I wrote this because I got bored hunting on stackoverflow and superuser

looking for a simple and quick way to determine which of my disks

were attached to which of my controllers

Basically it's a quick and dirty query using udevadm

Future improvements :

- Like to list the controller, then drives attached
but it's simpler to query the drives then lookup controller each time
- Like to have info presented a bit more concisely / orderly

Usage
-----

Probably needs to be run as root or su, so sudo for some people

Put script in home directory (or whereever)

chmod +x diskvscontroller.script.sh

./diskvscontroller.script.sh


Tested - Debian Stretch 4.9.0-6-amd64 #1 SMP Debian 4.9.88-1+deb9u1 (2018-05-07) x86_64 GNU/Linux

Thanks
------
Thanks to Jeremy Kerr - https://askubuntu.com/questions/168650/how-do-i-list-all-storage-devices-thumb-drives-external-hard-drives-that-are-c
for providing the basic mechanism to query udevadm in a loop
