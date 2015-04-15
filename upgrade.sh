#!/bin/bash

cd /home/rlpowell/config
git pull
yes | vim -c ':PlugInstall' -c ':qa'
yes | vim -c ':PlugUpdate' -c ':qa'
