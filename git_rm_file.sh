#!/bin/sh

for i in `git status | tail -n +7 | awk '{ print $1 }'`; do rm -rf $i; done;
