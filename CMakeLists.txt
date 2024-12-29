cmake_minimum_required(VERSION 3.19)
project(quake3e-apple-silicon C)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")

set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED ON)

add_compile_options(-Wall -Wimplicit -Wstrict-prototypes -Wno-unused-result)

# if(APPLE)
#   add_definitions(-DMACOS_X)
# endif()

# option(BUILD_CLIENT "Build the quake3 client" ON)
# option(BUILD_SERVER "Build the dedicated server" OFF)
# option(USE_SDL      "Use SDL2 for input, windowing, etc." ON)
# option(USE_OPENGL   "Compile with OpenGL support"         OFF)
# option(USE_VULKAN   "Compile with Vulkan support"         OFF) 

add_definitions(-DUSE_OPENGL_API)

# if(USE_SDL)
#   find_package(SDL2 REQUIRED)
#   if(NOT SDL2_FOUND)
#     message(FATAL_ERROR "SDL2 not found. Please install it (e.g., via Homebrew) or set SDL2_INCLUDE_DIRS/SDL2_LIBRARIES.")
#   endif()
# endif()

add_subdirectory(code/botlib)
add_subdirectory(code/client)
add_subdirectory(code/libjpeg)
add_subdirectory(code/qcommon)
add_subdirectory(code/renderer)
add_subdirectory(code/renderercommon)
add_subdirectory(code/sdl)
add_subdirectory(code/server)
add_subdirectory(code/unix)

# if(BUILD_CLIENT)

# endif()

# if(BUILD_SERVER)
# 	add_subdirectory(code/server)
# endif()

# if(BUILD_CLIENT)
#   install(TARGETS quake3e RUNTIME DESTINATION bin)
# endif()
# if(BUILD_SERVER)
#   install(TARGETS quake3e_ded RUNTIME DESTINATION bin)
# endif()

#
# Status message
#
message(STATUS "-------------------------------------")
message(STATUS "Building for Apple Silicon (arm64)")
message(STATUS "BUILD_CLIENT : ${BUILD_CLIENT}")
message(STATUS "BUILD_SERVER : ${BUILD_SERVER}")
message(STATUS "USE_SDL      : ${USE_SDL}")
message(STATUS "USE_OPENGL   : ${USE_OPENGL}")
message(STATUS "USE_VULKAN   : ${USE_VULKAN}")
message(STATUS "-------------------------------------")
