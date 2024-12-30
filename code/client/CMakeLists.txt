set(Q3_CLIENT_SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/cl_avi.c
    ${CMAKE_CURRENT_SOURCE_DIR}/cl_cgame.c
    ${CMAKE_CURRENT_SOURCE_DIR}/cl_cin.c
    ${CMAKE_CURRENT_SOURCE_DIR}/cl_console.c
    ${CMAKE_CURRENT_SOURCE_DIR}/cl_input.c
    ${CMAKE_CURRENT_SOURCE_DIR}/cl_jpeg.c
    ${CMAKE_CURRENT_SOURCE_DIR}/cl_keys.c
    ${CMAKE_CURRENT_SOURCE_DIR}/cl_main.c
    ${CMAKE_CURRENT_SOURCE_DIR}/cl_net_chan.c
    ${CMAKE_CURRENT_SOURCE_DIR}/cl_parse.c
    ${CMAKE_CURRENT_SOURCE_DIR}/cl_scrn.c
    ${CMAKE_CURRENT_SOURCE_DIR}/cl_ui.c
    ${CMAKE_CURRENT_SOURCE_DIR}/snd_adpcm.c
    ${CMAKE_CURRENT_SOURCE_DIR}/snd_codec.c
    ${CMAKE_CURRENT_SOURCE_DIR}/snd_codec_wav.c
    ${CMAKE_CURRENT_SOURCE_DIR}/snd_dma.c
    ${CMAKE_CURRENT_SOURCE_DIR}/snd_main.c
    ${CMAKE_CURRENT_SOURCE_DIR}/snd_mem.c
    ${CMAKE_CURRENT_SOURCE_DIR}/snd_mix.c
    ${CMAKE_CURRENT_SOURCE_DIR}/snd_wavelet.c
)

if(USE_CURL)
    list(APPEND Q3_CLIENT_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/cl_curl.c)
endif()

add_executable(quake3e ${Q3_CLIENT_SOURCES})

target_link_libraries(quake3e 
    PRIVATE 
    quake3e_qcommon
    quake3e_botlib
    quake3e_renderer
    quake3e_renderercommon
    quake3e_sdl
    quake3e_server
    quake3e_unix
    quake3e_jpg
)

set_target_properties(quake3e PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin"
)

add_custom_command(TARGET quake3e POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy
        "${PROJECT_SOURCE_DIR}/code/libsdl/macosx/libSDL2-2.0.0.dylib"
        $<TARGET_FILE_DIR:quake3e>
    COMMENT "Copying SDL2 dylib to the quake3e directory"
)