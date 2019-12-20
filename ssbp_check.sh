#!/bin/sh

find . -name '_DS_Store' -exec rm {} \;
find . -name '*.ssce' -exec rm {} \;
find . -name '*.ssae' -exec rm {} \;
find . -name '*.ssee' -exec rm {} \;
find . -name '*.psd' -exec rm {} \;
find . -name '*.sspj' -exec rm {} \;
find . -name 'chara_parts_0002.png' -exec rm {} \;
find . -name 'chara_parts_0003.png' -exec rm {} \;

