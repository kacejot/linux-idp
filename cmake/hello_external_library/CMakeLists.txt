cmake_minimum_required(VERSION 3.10)

project(hello_external_library)

add_library(hello STATIC IMPORTED)
set_property(TARGET hello PROPERTY IMPORTED_LOCATION libhello.a)

include_directories(include)
link_directories(${CMAKE_SOURCE_DIR}/lib)
add_executable(main main.cpp)
target_link_libraries(main hello)
