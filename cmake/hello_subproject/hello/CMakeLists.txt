cmake_minimum_required(VERSION 3.10)

project(hello)

set(SOURCE_FILES hello.cpp)
set(HEADER_FILES hello.h)

add_library(hello ${SOURCE_FILES})
