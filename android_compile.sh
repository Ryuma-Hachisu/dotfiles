#!/bin/sh

mv ./Resources/cocosstudio ./Resources/.cocosstudio
cocos compile -s ./ -p android --android-studio
mv ./Resources/.cocosstudio ./Resources/cocosstudio

