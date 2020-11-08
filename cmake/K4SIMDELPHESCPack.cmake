set(CPACK_PACKAGE_DESCRIPTION "K4SIMDELPHES: edm4hep output for delphes")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "K4SIMDELPHES: edm4hep output for delphes")
set(CPACK_PACKAGE_VENDOR "HEP Software Foundation")
set(CPACK_PACKAGE_VERSION ${K4SIMDELPHES_VERSION})
set(CPACK_PACKAGE_VERSION_MAJOR ${K4SIMDELPHES_MAJOR_VERSION})
set(CPACK_PACKAGE_VERSION_MINOR ${K4SIMDELPHES_MINOR_VERSION})
set(CPACK_PACKAGE_VERSION_PATCH ${K4SIMDELPHES_PATCH_VERSION})

set(CPACK_PACKAGE_NAME "K4SIMDELPHES")
set(CPACK_SET_DESTDIR TRUE)
set(CPACK_PACKAGE_HOMEPAGE_URL "https://github.com/HSF/K4SIMDELPHES")
set(CPACK_PACKAGE_DESCRIPTION "edm4hep output for delphes")

# required fields for .deb
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "valentin.volkl@cern.ch")
set(CPACK_DEBIAN_PACKAGE_HOMEPAGE ${CPACK_PACKAGE_HOMEPAGE_URL})
set(CPACK_DEBIAN_PACKAGE_RECOMMENDS "delphes, edm4hep")

set(CPACK_PACKAGE_DESCRIPTION_FILE "${CMAKE_SOURCE_DIR}/README.md")
set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_SOURCE_DIR}/LICENSE")
set(CPACK_RESOURCE_FILE_README "${CMAKE_SOURCE_DIR}/README.md")

#--- source package settings ---------------------------------------------------
set(CPACK_SOURCE_IGNORE_FILES
    ${PROJECT_BINARY_DIR}
    "~$"
    "/.git/"
    "/\\\\\\\\.git/"
    "/#"
)
set(CPACK_SOURCE_STRIP_FILES "")

#--- translate buildtype -------------------------------------------------------
if(NOT CMAKE_CONFIGURATION_TYPES)
  string(TOLOWER "${CMAKE_BUILD_TYPE}" HSF_DEFAULT_BUILDTYPE)
endif()

set(HSF_BUILDTYPE "unknown")

if(HSF_DEFAULT_BUILDTYPE STREQUAL "release")
  set(HSF_BUILDTYPE "opt")
elseif(HSF_DEFAULT_BUILDTYPE STREQUAL "debug")
  set(HSF_BUILDTYPE "dbg")
elseif(HSF_DEFAULT_BUILDTYPE STREQUAL "relwithdebinfo")
  set(HSF_BUILDTYPE "owd")
endif()


set(CPACK_PACKAGE_RELOCATABLE True)
set(CPACK_PACKAGE_INSTALL_DIRECTORY "K4SIMDELPHES_${K4SIMDELPHES_VERSION}")
set(CPACK_PACKAGE_FILE_NAME "K4SIMDELPHES_${K4SIMDELPHES_VERSION}")

include(CPack)
