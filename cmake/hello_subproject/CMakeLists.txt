cmake_minimum_required(VERSION 3.10)

project(hello_subproject)

set(SOURCE_FILES main.cpp)

include_directories(hello)
add_subdirectory(hello)
add_executable(main ${SOURCE_FILES})

target_link_libraries(main hello)
