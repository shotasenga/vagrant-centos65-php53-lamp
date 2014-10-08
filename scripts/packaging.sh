#!/bin/bash

#
# this script creates box file
#

BOX_NAME="centos65-php53-lamp.box"

vagrant exec sudo ln -s -f /dev/null /etc/udev/rules.d/70-persistent-net.rules
vagrant package -o $BOX_NAME
