cmake_minimum_required(VERSION 3.10)

project(hello_package)

find_package(OpenGL REQUIRED)
if(NOT OpenGL_FOUND)
    message(SEND_ERROR "Failed to find OpenGL")
	return()
else()
    include_directories(${OpenGL_INCLUDE_DIRS})
endif()


find_package(Vulkan REQUIRED)
if(NOT Vulkan_FOUND)
	message(SEND_ERROR "Failed to find Vulkan")
	return()
else()
    include_directories(${Vulkan_INCLUDE_DIRS})
endif()

add_executable(hello main.cpp)
target_link_libraries(hello 
    ${Vulkan_LIBRARIES}
    ${OpenGL_LIBRARIES})
