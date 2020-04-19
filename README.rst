Fish Configuration
==================

Personal configuration for Fish (Friendly interactive shell).

For this configuration to work, it is assumed that Fish is installed on the
system. On Arch Linux this can be done as follows:

.. code:: bash

    sudo pacman --sync --refresh --noconfirm fish

To install, clone the repository into the fish configuration folder:

.. code:: bash

    git clone https://github.com/jonathf/fish ~/.config/fish

For some specialised features for Neovim, a Python3 virtual environment is
created in the same folder:

.. code:: bash

    python -m venv ~/.config/fish/venv
    ~/.config/fish/venv/bin/pip install neovim
