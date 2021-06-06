#! /bin/bash

echo ">>>>>>>> deploying fe <<<<<<<<<<<"
echo

FEPATH="."
PUBLICPATH="../public"

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

# eval "rm -rf !(*gitkeep) ${PUBLICPATH} "
# command rm -rf '!(*.gitkeep)'
# eval "rm -rf '!(*.gitkeep)'"
# rm -rf '!(*.gitkeep)'
rm *.html
rm -r assets

cd ..

pwd

echo ">>>>>>>>>>>>>copying files from dist to public <<<<<<<<<<<<<"
echo

cp FE/dist/*.html ./public/
mkdir public/assets
cp FE/dist/*js ./public/assets
