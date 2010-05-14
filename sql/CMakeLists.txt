add_subdirectory(updates)
add_subdirectory(FULL)
add_subdirectory(AC1)

########### install files ###############

FILE(GLOB _SQL *.sql)

install(FILES ${_SQL} DESTINATION share/trinity/sql)
