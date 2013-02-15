#!/bin/sh
for i in `find . -name '*.wrl'`; do
    meshlabserver -i $i -o `pwd`/$(echo `basename $i` | sed 's|.wrl$|.dae|')
done


# using meshconv (http://www.cs.princeton.edu/~min/meshconv/)
# for i in `find  ~/software/wip/devel-src/SoT/romeo-sot.git/data/ -name '*.wrl'`; do
#     ~/applications/meshconv -c stl -tri $i
# done

