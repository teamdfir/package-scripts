#!/bin/bash

gpg --import sift.asc

git clone --recursive $GIT_URL $PROJECT

cd $PROJECT

git checkout $GIT_TAG

cp -R /opt/debian .

dpkg-buildpackage
