add_library(quake3e_vorbis STATIC)

target_sources(quake3e_vorbis
    PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/lib/analysis.c
    ${CMAKE_CURRENT_SOURCE_DIR}/lib/bitrate.c
    ${CMAKE_CURRENT_SOURCE_DIR}/lib/block.c
    ${CMAKE_CURRENT_SOURCE_DIR}/lib/codebook.c
    ${CMAKE_CURRENT_SOURCE_DIR}/lib/envelope.c
    ${CMAKE_CURRENT_SOURCE_DIR}/lib/floor0.c
    ${CMAKE_CURRENT_SOURCE_DIR}/lib/floor1.c
    ${CMAKE_CURRENT_SOURCE_DIR}/lib/info.c
    ${CMAKE_CURRENT_SOURCE_DIR}/lib/lookup.c
    ${CMAKE_CURRENT_SOURCE_DIR}/lib/lpc.c
    ${CMAKE_CURRENT_SOURCE_DIR}/lib/lsp.c
    ${CMAKE_CURRENT_SOURCE_DIR}/lib/mapping0.c
    ${CMAKE_CURRENT_SOURCE_DIR}/lib/mdct.c
    ${CMAKE_CURRENT_SOURCE_DIR}/lib/psy.c
    ${CMAKE_CURRENT_SOURCE_DIR}/lib/registry.c
    ${CMAKE_CURRENT_SOURCE_DIR}/lib/res0.c
    ${CMAKE_CURRENT_SOURCE_DIR}/lib/sharedbook.c
    ${CMAKE_CURRENT_SOURCE_DIR}/lib/smallft.c
    ${CMAKE_CURRENT_SOURCE_DIR}/lib/synthesis.c
    ${CMAKE_CURRENT_SOURCE_DIR}/lib/vorbisfile.c
    ${CMAKE_CURRENT_SOURCE_DIR}/lib/window.c
)

add_compile_options(VORBIS_FLAGS)

target_include_directories(quake3e_vorbis
    PUBLIC 
    ${CMAKE_CURRENT_SOURCE_DIR}/include
)

target_link_libraries(quake3e_vorbis
    PRIVATE
    quake3e_ogg
)
