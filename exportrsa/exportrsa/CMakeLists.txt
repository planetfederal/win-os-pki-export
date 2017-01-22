########################################################
# Files

SET(EXPORTRSA_SRCS
  exportrsa.cpp
  stdafx.cpp
)

SET(EXPORTRSA_HDRS
  stdafx.h
  targetver.h
)

########################################################
# Build

ADD_EXECUTABLE(exportrsa WIN32 ${EXPORTRSA_SRCS} ${EXPORTRSA_HDRS})

INCLUDE_DIRECTORIES (
  ${CMAKE_CURRENT_SOURCE_DIR}
)

ADD_DEFINITIONS(-DUNICODE -D_UNICODE)

SET_TARGET_PROPERTIES(exportrsa PROPERTIES 
  LINK_FLAGS "/SUBSYSTEM:CONSOLE"
  COMPILE_DEFINITIONS "_CONSOLE"
)

# Not necessary to explicitly link to Win system libs? Works without this
# TARGET_LINK_LIBRARIES(exportrsa
  # advapi32
  # crypt32
  # ncrypt
# )

########################################################
# Install

INSTALL(TARGETS exportrsa
  RUNTIME DESTINATION bin
)
