cmake_minimum_required(VERSION 3.10)

project (main)

add_executable(${PROJECT_NAME} main.cpp)
target_include_directories(${PROJECT_NAME} PUBLIC include)
