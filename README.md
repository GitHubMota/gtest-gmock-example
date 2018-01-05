# gtest-gmock-example
Example to show how to use googletest include gtest and gmock

# Quick start

    # export GTEST_ROOT=/where/google/test/is/installed/
    # cd gmockSample
    # sh normal.sh
    
`normal.sh` will run `cmake .; make` and run the test target.

test target is generated in build dir.

# Coverage Collect (Optionally)
Optionally to run `instr.sh` if want to generate the code coverage report. But at first need to install lcov tool.

    # git clone https://github.com/linux-test-project/lcov.git 
    # cd lcov; make install

After run `instr.sh` successfully, you can open the build/lcov-html/index.html in browser to check the coverage report.
