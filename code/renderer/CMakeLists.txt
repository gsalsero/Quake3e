add_library(quake3e_renderer ${RENDERER_SOURCES})

target_sources(quake3e_renderer
    PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/tr_animation.c
    ${CMAKE_CURRENT_SOURCE_DIR}/tr_arb.c
    ${CMAKE_CURRENT_SOURCE_DIR}/tr_backend.c
    ${CMAKE_CURRENT_SOURCE_DIR}/tr_bsp.c
    ${CMAKE_CURRENT_SOURCE_DIR}/tr_cmds.c
    ${CMAKE_CURRENT_SOURCE_DIR}/tr_curve.c
    ${CMAKE_CURRENT_SOURCE_DIR}/tr_flares.c
    ${CMAKE_CURRENT_SOURCE_DIR}/tr_image.c
    ${CMAKE_CURRENT_SOURCE_DIR}/tr_init.c
    ${CMAKE_CURRENT_SOURCE_DIR}/tr_light.c
    ${CMAKE_CURRENT_SOURCE_DIR}/tr_main.c
    ${CMAKE_CURRENT_SOURCE_DIR}/tr_marks.c
    ${CMAKE_CURRENT_SOURCE_DIR}/tr_mesh.c
    ${CMAKE_CURRENT_SOURCE_DIR}/tr_model.c
    ${CMAKE_CURRENT_SOURCE_DIR}/tr_model_iqm.c
    ${CMAKE_CURRENT_SOURCE_DIR}/tr_scene.c
    ${CMAKE_CURRENT_SOURCE_DIR}/tr_shade.c
    ${CMAKE_CURRENT_SOURCE_DIR}/tr_shade_calc.c
    ${CMAKE_CURRENT_SOURCE_DIR}/tr_shader.c
    ${CMAKE_CURRENT_SOURCE_DIR}/tr_shadows.c
    ${CMAKE_CURRENT_SOURCE_DIR}/tr_sky.c
    ${CMAKE_CURRENT_SOURCE_DIR}/tr_surface.c
    ${CMAKE_CURRENT_SOURCE_DIR}/tr_vbo.c
    ${CMAKE_CURRENT_SOURCE_DIR}/tr_world.c
)

target_link_libraries(quake3e_renderer
    PRIVATE 
    quake3e_renderercommon
)
