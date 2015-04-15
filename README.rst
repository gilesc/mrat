Dependencies
============

- curl
- Subset of the Kent utilities
- bedtools

The latter two can be installed (if not already) to $HOME/.local/bin with the
command:

.. code-block:: bash

    ./ensure-dependencies.sh

Installation
============

.. code-block:: bash
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX:PATH=$HOME/.local/ ..
    make install

Usage
=====

You may need to set your path by adding the following line to your
``$HOME/.bashrc``, if it isn't already there:

.. code-block:: bash
    
    export PATH="$PATH:$HOME/.local/bin"

Now, the programs will be in your ``$PATH``. You can get detailed help for any
command by running ``command -h``. The commands are:

- ``region-coverage`` : queries coverage for each region in a BED file inside a
  BigWig file
