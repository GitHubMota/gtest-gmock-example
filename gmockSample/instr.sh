#!/bin/sh
# Collect coverage summary
target=hello-world
CovInPath=CMakeFiles/${target}.dir/src
CovOutPath=./lcov-html

mkdir -p build; cd build
rm -f $CovInPath/*.gcda
cmake .. -DGCOV=ON
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
geninfo -o ./coverage.info $CovInPath
genhtml --legend --output-directory ./ --show-details -o $CovOutPath ./coverage.info
cd -
