#!/bin/sh

GITHUB_SRC=github.com/golang
SRC=$GOPATH/src/github.com/golang
DST=$GOPATH/src/golang.org/x

PKGS=(net tools oauth2 crypto sys text image time sync mobile exp)
NUM_OF_PKGS=11

# get all golang/x pkgs
get_pkgs() {
	for (( I=0; I<$NUM_OF_PKGS; ++I))
	do
		echo "Getting/Updating package ${GITHUB_SRC}/${PKGS[I]}"
		go get -u -v $GITHUB_SRC/${PKGS[I]}
    done
}

# copy to the right position 
cp_to_golangorg_dir() {
	if [ ! -d $DST ]; then
  		mkdir $DST
	fi
	
	sudo \cp -r $SRC/* $DST
}

echo "Step One : Getting/Updating packages from github"
get_pkgs
echo "Step Two : Copy packages to ${DST}"
cp_to_golangorg_dir
echo "All Done!"
