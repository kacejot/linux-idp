cmake_minimum_required(VERSION 3.10)

project(hello_external_library)

add_library(hello STATIC IMPORTED)
set_property(TARGET hello PROPERTY IMPORTED_LOCATION ${CMAKE_SOURCE_DIR}/lib/libhello.a)

include_directories(include)
add_executable(main main.cpp)
target_link_libraries(main hello)
