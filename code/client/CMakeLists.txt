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

if(USE_OGG_VORBIS)
    list(APPEND Q3_CLIENT_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/snd_codec_ogg.c)
endif()

add_executable(quake3e ${Q3_CLIENT_SOURCES})

target_link_libraries(quake3e 
    PRIVATE 
    qcommon
    botlib
    renderer
    renderercommon
    sdl
    server
    unix
    jpg
)

if(USE_OGG_VORBIS)
    if(NOT USE_SYSTEM_OGG)
        target_link_libraries(quake3e
            PRIVATE
            ogg
        )
    else()
        find_package(PkgConfig REQUIRED)

        pkg_check_modules(OGG REQUIRED ogg)

        if(OGG_FOUND)
            target_include_directories(quake3e PRIVATE ${OGG_INCLUDE_DIRS})
            target_link_libraries(quake3e PRIVATE ${OGG_LIBRARIES})
        else()
            add_compile_options(-logg)
        endif()
    endif()
    if(NOT USE_SYSTEM_VORBIS)
        target_link_libraries(quake3e
            PRIVATE
            vorbis
        )
    else()
        find_package(PkgConfig REQUIRED)

        pkg_check_modules(VORBIS REQUIRED vorbisfile)

        if(VORBIS_FOUND)
            target_include_directories(quake3e PRIVATE  ${VORBIS_INCLUDE_DIRS})
            target_link_libraries(quake3e PRIVATE ${VORBIS_LIBRARIES})
        else()
            add_compile_options(-lvorbisfile)
        endif()
    endif()
endif()

set_target_properties(quake3e PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin"
)

add_custom_command(TARGET quake3e POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy
        "${PROJECT_SOURCE_DIR}/code/libsdl/macosx/libSDL2-2.0.0.dylib"
        $<TARGET_FILE_DIR:quake3e>
    COMMENT "Copying SDL2 dylib to the quake3e directory"
)