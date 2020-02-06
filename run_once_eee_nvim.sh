#!/bin/sh
echo 'Installing vim plugins'
/usr/bin/nvim +PlugInstall +qall
echo 'Done'
