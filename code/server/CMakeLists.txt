set(SERVER_SOURCES
	${CMAKE_CURRENT_SOURCE_DIR}/sv_bot.c
	${CMAKE_CURRENT_SOURCE_DIR}/sv_ccmds.c
	${CMAKE_CURRENT_SOURCE_DIR}/sv_client.c
	${CMAKE_CURRENT_SOURCE_DIR}/sv_filter.c
	${CMAKE_CURRENT_SOURCE_DIR}/sv_game.c
	${CMAKE_CURRENT_SOURCE_DIR}/sv_init.c
	${CMAKE_CURRENT_SOURCE_DIR}/sv_main.c
	${CMAKE_CURRENT_SOURCE_DIR}/sv_net_chan.c
	${CMAKE_CURRENT_SOURCE_DIR}/sv_snapshot.c
	${CMAKE_CURRENT_SOURCE_DIR}/sv_world.c
)

if(BUILD_CLIENT)
	add_library(server STATIC)

	target_sources(server
		PRIVATE
			${SERVER_SOURCES}
	)
endif()

if(BUILD_SERVER)
	add_executable(quake3e_ded ${SERVER_SOURCES})

	target_compile_definitions(quake3e_ded PRIVATE DEDICATED)

	target_link_libraries(quake3e_ded
		PRIVATE
			qcommon_ded
			botlib
			unix_ded
	)
endif()