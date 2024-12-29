add_library(quake3e_unix STATIC)

target_sources(quake3e_unix
	PRIVATE
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
