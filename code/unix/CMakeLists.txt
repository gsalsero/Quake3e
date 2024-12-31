set(UNIX_SOURCES
    # ${CMAKE_CURRENT_SOURCE_DIR}/linux_glimp.c
    # ${CMAKE_CURRENT_SOURCE_DIR}/linux_joystick.c
    # ${CMAKE_CURRENT_SOURCE_DIR}/linux_qgl.c
    # ${CMAKE_CURRENT_SOURCE_DIR}/linux_qvk.c
    ${CMAKE_CURRENT_SOURCE_DIR}/linux_signals.c
    # ${CMAKE_CURRENT_SOURCE_DIR}/linux_snd.c
    ${CMAKE_CURRENT_SOURCE_DIR}/unix_main.c
    ${CMAKE_CURRENT_SOURCE_DIR}/unix_shared.c
    # ${CMAKE_CURRENT_SOURCE_DIR}/x11_dga.c
    # ${CMAKE_CURRENT_SOURCE_DIR}/x11_randr.c
    # ${CMAKE_CURRENT_SOURCE_DIR}/x11_vidmode.c
)

if(BUILD_CLIENT)
add_library(unix STATIC)

target_sources(unix
	PRIVATE
        ${UNIX_SOURCES}
)
endif()

if(BUILD_SERVER)
    add_library(unix_ded STATIC)

    target_compile_definitions(unix_ded PRIVATE DEDICATED)

    target_sources(unix_ded
        PRIVATE
            ${UNIX_SOURCES}
    )
endif()