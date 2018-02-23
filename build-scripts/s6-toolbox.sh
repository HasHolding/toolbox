#!/bin/bash

# S6 overlay builder

set -e
set -x

cd /tmp/
git clone https://git.skarnet.org/cgi-bin/cgit.cgi/s6 
git clone https://git.skarnet.org/cgi-bin/cgit.cgi/execline 
git clone https://git.skarnet.org/cgi-bin/cgit.cgi/skalibs

cd /tmp/skalibs/
git checkout tags/$(git describe --abbrev=0 --tags)
./configure && make && make install

cd /tmp/execline/
git checkout tags/$(git describe --abbrev=0 --tags)
./configure && make && make install
	
cd /tmp/s6/
git checkout tags/$(git describe --abbrev=0 --tags)
./configure && make && make install DESTDIR=dist
