add_library(quake3e_ogg STATIC)

target_sources(quake3e_ogg
    PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/src/bitwise.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/framing.c
)

add_compile_options(OGG_FLAGS)

target_include_directories(quake3e_ogg
    PUBLIC 
    ${CMAKE_CURRENT_SOURCE_DIR}/include
) 
