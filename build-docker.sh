#! /bin/bash

####################### TO run this script, pass fepath as first arguement and publicpath as second arguement.
## eg: ./build-docker.sh . ./public

echo ">>>>>>>> deploying fe <<<<<<<<<<<"
echo

# FEPATH="."
# PUBLICPATH="./public"
FEPATH=$1
PUBLICPATH=$2

# echo "changing directory to ${FEPATH}"
# echo

# command cd ${FEPATH}

echo ">>>>>>>>>>>>>>> removing existing public directory <<<<<<<<<<<<<"

command rm -rf ${PUBLICPATH}

echo ">>>>>>>>>>>>>>>>> creating public directory <<<<<<<<<<<<<<<<<"
command mkdir ${PUBLICPATH}

echo ">>>>>>>>>>>>>>> Building Dev <<<<<<<<<<<<"
echo

#TODO: make this step optional with some flag
# npm install 


npm run build-dev


# command cd ".."
command cd ${PUBLICPATH}

command pwd

echo ">>>>>>>>>>>>>>> cleaning ${pwd}<<<<<<<<<<<<<<"
echo

cd ..

pwd

echo ">>>>>>>>>>>>>copying files from dist to public <<<<<<<<<<<<<"
echo

cp ./dist/*.html ./public/
mkdir ${PUBLICPATH}/assets
cp ./dist/*js ${PUBLICPATH}/assets
