#!/bin/bash
echo "#########################################################################"

IMG_NAME="apercova/ubuntu18.04-server-jre"
FILE_PATTERN="server-jre-7*linux*.tar.gz"
FILENAME_REGEXP="(server-jre-)(7\w+)(.*\.tar\.gz)"
DEF_VERSION="7.generic"


echo "Getting image version ..."
echo ""
if [ `ls -al $FILE_PATTERN 2>/dev/null | wc -l` -gt 1 ]; then
  echo "ERROR: Multiple versions of server-jre tarball file.";
  echo "ERROR: Only one tarball file is allowed into this directory!";
  exit 1;
else
  FILENAME=$(ls $FILE_PATTERN 2>/dev/null)
  
  if [[ $FILENAME =~ $FILENAME_REGEXP ]]; then
    VERSION=${BASH_REMATCH[2]}
  else
    VERSION="$DEF_VERSION"
  fi;
fi;
IMG_NAME="$IMG_NAME:$VERSION"
docker info
echo ""
echo "Building image $IMG_NAME"
echo ""
docker build -t $IMG_NAME .
echo ""
echo "#########################################################################"



