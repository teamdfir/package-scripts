#!/bin/bash

gpg --import erik-kristensen.key

git clone --recursive $GIT_URL $PROJECT

cd ${PROJECT}

git checkout $GIT_TAG

cp -R /opt/debian .

dch -D $DISTRIBUTION -u low -v $VERSION~$DISTRIBUTION "Building for SIFT and $DISTRIBUTION"

if [ $? -eq 25 ]; then
  echo "Error running dch! Exiting ..."
  exit 25
fi

debuild -S -i -I

cd /opt 

dput ppa:sift/${PPA} ${PROJECT}_${VERSION}~${DISTRIBUTION}_source.changes
