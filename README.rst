Fish Configuration
==================

Personal configuration for Fish (Friendly interactive shell).

Installation
------------

To install, follow the steps:

1. Clone the repository into the fish configuration folder:

   .. code:: bash

       git clone https://github.com/jonathf/fish ~/.config/fish

1. It is assumed that Fish is installed on the system. On Arch Linux this can
   be done as follows:

   .. code:: bash

       sudo pacman --sync --refresh --noconfirm fish

   If on a system without root access

   .. code:: bash

       cd ~/.config/fish
       bash fish_install.sh

2. Change the default shell to Fish. In case Fish is installed
   globally, this can be done using the command:

   .. code:: bash

       chsh --shell /usr/bin/fish

   If installed locally, run the following command instead:

   .. code:: bash

       chsh --shell $HOME/.local/bin/fish

3. (Optional) Install Neovim interface ``pynvim`` into a python (>=3.6.1)
   virtual environment:

   .. code:: bash

       python -m venv ~/.config/fish/venv
       ~/.config/fish/venv/bin/pip install --upgrade pip pynvim
