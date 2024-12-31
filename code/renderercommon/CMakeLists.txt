add_library(renderercommon STATIC)

target_sources(renderercommon
    PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/tr_font.c
    ${CMAKE_CURRENT_SOURCE_DIR}/tr_image_bmp.c
    ${CMAKE_CURRENT_SOURCE_DIR}/tr_image_jpg.c
    ${CMAKE_CURRENT_SOURCE_DIR}/tr_image_pcx.c
    ${CMAKE_CURRENT_SOURCE_DIR}/tr_image_png.c
    ${CMAKE_CURRENT_SOURCE_DIR}/tr_image_tga.c
    ${CMAKE_CURRENT_SOURCE_DIR}/tr_noise.c
)
