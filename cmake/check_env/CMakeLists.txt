cmake_minimum_required(VERSION 3.10)
project(check_env)

if(DEFINED ENV{ARCH})
    message("ARCH is defined and its value is: $ENV{ARCH}")
endif()

