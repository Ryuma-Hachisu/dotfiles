#!/bin/sh

for i in `git status | tail -n +5 | awk '{ print $2 }'`; do rm -rf $i; done;for i in `git status | tail -n +5 | awk '{ print $2 }'`; do rm -rf $i; done;