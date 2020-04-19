Fish Configuration
==================

Personal configuration for Fish (Friendly interactive shell).

Installation
------------

To install, follow the steps:

1. It is assumed that Fish is installed on the system. On Arch Linux this can
   be done as follows:

   .. code:: bash

       sudo pacman --sync --refresh --noconfirm fish

2. Clone the repository into the fish configuration folder:

   .. code:: bash

       git clone https://github.com/jonathf/fish ~/.config/fish

3. For some specialised features for Neovim, a Python3 virtual environment is
   created in the same folder:

   .. code:: bash

       python -m venv ~/.config/fish/venv
       ~/.config/fish/venv/bin/pip install neovim

4. The configuration file  ``/etc/passwd`` defines behavior for each of the
   users. It is a ``:``-seperated list where the first entry is the user name
   and the last entry is the default shell.

   Edit the file (as root) so that the default shell is ``/usr/bin/fish``.

   For example, assuming your username is ``foobar`` and the file contains an
   entry:

   .. code:: config

        foobar:x:1000:1001:Foo Bar:/home/foobar:/bin/bash

   It should be edited to say:

   .. code:: config

        foobar:x:1000:1001:Foo Bar:/home/foobar:/usr/bin/fish
