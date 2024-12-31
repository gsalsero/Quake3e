add_library(ogg STATIC)

target_sources(ogg
    PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/src/bitwise.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/framing.c
)

add_compile_options(OGG_FLAGS)

target_include_directories(ogg
    PUBLIC 
    ${CMAKE_CURRENT_SOURCE_DIR}/include
) 
