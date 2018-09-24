cmake_minimum_required(VERSION 3.10)

project(hello_library)

add_library(hello hello.cpp)
add_executable(main main.cpp)

target_link_libraries(main hello)
