#!/usr/bin/env bash

url=http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/

tmpdir=$(mktemp -d)
trap 'rm -rf $tmpdir' EXIT SIGKILL SIGTERM

prefix=$HOME/.local/
mkdir -p $prefix/bin
export PATH="$PATH:$prefix/bin"

# Kent utilities

for util in bedGraphToBigWig bigWigAverageOverBed; do
    target=$prefix/bin/$util
    which $util &> /dev/null || {
        curl -o $target $url/$util
        chmod +x $target
    }
done

# bedtools

which bedtools &> /dev/null || {
    git clone https://github.com/arq5x/bedtools2.git $tmpdir/bedtools2
    cd $tmpdir/bedtools2
    make -j
    cp bin/bedtools $prefix/bin
}
