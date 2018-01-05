cmake_minimum_required(VERSION 2.8)
project(project_name)

SET(TARGET hello-world)
SET(GTEST_PATH $ENV{GTEST_PATH})
SET(BUILD_PATH "${CMAKE_SOURCE_DIR}")
SET(EXECUTABLE_OUTPUT_PATH "${CMAKE_SOURCE_DIR}/build")

INCLUDE_DIRECTORIES(
    ${GTEST_PATH}/googlemock/include
    ${GTEST_PATH}/googletest/include
    ${BUILD_PATH}/include
)

add_subdirectory(${GTEST_PATH} gtest)

IF(GCOV)
    ADD_DEFINITIONS("-fprofile-arcs -ftest-coverage")
    SET(CMAKE_EXE_LINKER_FLAGS "-fprofile-arcs -ftest-coverage")  
    SET(CMAKE_CXX_FLAGS "-DNDEBUG -D__STDC_FORMAT_MACROS -Wall -O0 -Wno-sign-compare -std=c++11")
ELSE()
    SET(CMAKE_CXX_FLAGS "-DNDEBUG -D__STDC_FORMAT_MACROS -Wall -O2 -Wno-sign-compare -std=c++11")
endif()

SET(GTEST_SRC
    ${GTEST_PATH}/googlemock/src/gmock_main.cc
)

AUX_SOURCE_DIRECTORY(./test TEST_FILES)

SET(SRC_FILES
    ${BUILD_PATH}/src/HelloWorld.cpp
)

ADD_EXECUTABLE(${TARGET}
    ${GTEST_SRC}
    ${SRC_FILES}                                                                                                                                             
    ${TEST_FILES}
)

TARGET_LINK_LIBRARIES(${TARGET} gmock)
