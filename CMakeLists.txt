cmake_minimum_required(VERSION 3.19)
project(quake3e-apple-silicon C)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")

set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED ON)

add_compile_options(-Wall -Wimplicit -Wstrict-prototypes -Wno-unused-result -pipe)


if(APPLE)
  add_compile_definitions(MACOS_X USE_LOCAL_HEADERS)
  add_compile_options(-arch arm64)
endif()

option(BUILD_CLIENT "Build the quake3 client" ON)
option(BUILD_SERVER "Build the dedicated server" OFF)
option(USE_SDL      "Use SDL2 for input, windowing, etc." ON)
option(USE_OPENGL   "Compile with OpenGL support"         OFF)
option(USE_VULKAN   "Compile with Vulkan support"         OFF) 
option(GENERATE_DEPENDENCIES "Generate dependency files during compilation" ON)

if(GENERATE_DEPENDENCIES)
    add_compile_options(-MMD)
endif()

add_compile_definitions(USE_OPENGL_API)
add_compile_definitions(DEBUG _DEBUG)
add_compile_options(-g -O0)

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

# Execute grep and sed to extract the version from q_shared.h
execute_process(
    COMMAND sh -c "grep '\\+define[ \t]\\+Q3_VERSION[ \t]\\+\\+' code/qcommon/q_shared.h | sed -e 's/.*\".* \\([^ ]*\\)\"/\\1/'"
    WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
    OUTPUT_VARIABLE Q3_VERSION_RAW
    ERROR_QUIET
    OUTPUT_STRIP_TRAILING_WHITESPACE
)

# Fallback if grep/sed doesn't find the version
if(Q3_VERSION_RAW)
    set(Q3_VERSION "${Q3_VERSION_RAW}")
else()
    set(Q3_VERSION "1.32e")  # Default fallback
endif()

#
#  message
#
message( "-------------------------------------")
file(RELATIVE_PATH RELATIVE_BUILD_DIR ${CMAKE_SOURCE_DIR} ${CMAKE_BINARY_DIR})
message( "Building quake3 in: ${RELATIVE_BUILD_DIR}")
message( "")
message( "  VERSION: ${Q3_VERSION}")
message( "  PLATFORM: ${CMAKE_SYSTEM_NAME}")
message( "  ARCH: ${CMAKE_SYSTEM_PROCESSOR}")

get_filename_component(COMPILER_NAME ${CMAKE_C_COMPILER} NAME)
message( "  CC: ${COMPILER_NAME}")

message( "")

get_directory_property(MY_OPTIONS COMPILE_OPTIONS)
message( "  Compile options:")
foreach(flag IN LISTS MY_OPTIONS)
  message( "    ${flag}")
endforeach()

message( "")
get_directory_property(MY_DEFS COMPILE_DEFINITIONS)
message( "  Compile definitions:")
foreach(def IN LISTS MY_DEFS)
  message( "    ${def}")
endforeach()

message( "")
message( "-------------------------------------")
