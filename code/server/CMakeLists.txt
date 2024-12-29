add_library(quake3e_server STATIC)

target_sources(quake3e_server
	PRIVATE
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
