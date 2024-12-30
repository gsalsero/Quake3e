add_library(quake3e_sdl STATIC)

target_sources(quake3e_sdl
	PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/sdl_gamma.c
    ${CMAKE_CURRENT_SOURCE_DIR}/sdl_glimp.c
    ${CMAKE_CURRENT_SOURCE_DIR}/sdl_input.c
    ${CMAKE_CURRENT_SOURCE_DIR}/sdl_snd.c
)

if(APPLE AND USE_LOCAL_HEADERS)
    target_include_directories(quake3e_sdl
        PRIVATE
            ${CMAKE_CURRENT_SOURCE_DIR}/../libsdl/include/SDL2
    )

    target_link_libraries(quake3e_sdl
        PRIVATE
            ${CMAKE_CURRENT_SOURCE_DIR}/../libsdl/macosx/libSDL2-2.0.0.dylib
    )
endif()
