#!/bin/sh
target=hello-world

mkdir -p build; cd build
cmake .. -DGCOV=OFF
if [ $? -ne 0 ]; then
    echo "some err in CMakeLists.txt!!!"
    exit 1
fi

make -j4
if [ $? -ne 0 ]; then
    echo "some err during make!!!"
    exit 1
fi

./${target} $*
cd -
