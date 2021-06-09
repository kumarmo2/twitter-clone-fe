#! /bin/bash

####################### TO run this script, pass fepath as first arguement and publicpath as second arguement and env as third.
## eg: ./build-docker.sh . ./public

echo ">>>>>>>> deploying fe <<<<<<<<<<<"
echo

FEPATH=$1 #deprecated but still need to pass.
PUBLICPATH=$2
ENV=$3


echo ">>>>>>>>>>>>>>> removing existing public directory <<<<<<<<<<<<<"

command rm -rf ${PUBLICPATH}

echo ">>>>>>>>>>>>>>>>> creating public directory <<<<<<<<<<<<<<<<<"
command mkdir ${PUBLICPATH}

echo ">>>>>>>>>>>>>>> Building Dev <<<<<<<<<<<<"
echo

#TODO: make this step optional with some flag
# npm install 


npm run build-${ENV}

command pwd

echo ">>>>>>>>>>>>>>> cleaning ${pwd}<<<<<<<<<<<<<<"
echo


pwd

echo ">>>>>>>>>>>>>copying files from dist to public <<<<<<<<<<<<<"
echo

cp ./dist/*.html ${PUBLICPATH}/
mkdir ${PUBLICPATH}/assets
cp ./dist/*js ${PUBLICPATH}/assets
