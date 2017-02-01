#!/bin/sh

GOLANG_SRC=golang.org/x

# get all golang/x pkgs
PKGS=(net tools oauth2 crypto sys text image time sync mobile exp)
NUM_OF_PKGS=11

# get all golang/x pkgs
get_pkgs() {
	for (( I=0; I<$NUM_OF_PKGS; ++I))
	do
		echo "Getting/Updating package ${GOLANG_SRC}/${PKGS[I]}"
		go get -u -v $GOLANG_SRC/${PKGS[I]}
    done
}


echo "Getting/Updating packages from golang.org"
get_pkgs
echo "All Done!"
