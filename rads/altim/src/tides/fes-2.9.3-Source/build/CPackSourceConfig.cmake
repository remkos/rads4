# This file will be configured to contain variables for CPack. These variables
# should be set in the CMake list file of the project before CPack module is
# included. The list of available CPACK_xxx variables and their associated
# documentation may be obtained using
#  cpack --help-variable-list
#
# Some variables are common to all generators (e.g. CPACK_PACKAGE_NAME)
# and some are specific to a generator
# (e.g. CPACK_NSIS_EXTRA_INSTALL_COMMANDS). The generator specific variables
# usually begin with CPACK_<GENNAME>_xxxx.


set(CPACK_BUILD_SOURCE_DIRS "/Users/davidtrossman/Documents/Code/rads/altim/src/tides/fes-2.9.3-Source;/Users/davidtrossman/Documents/Code/rads/altim/src/tides/fes-2.9.3-Source/build")
set(CPACK_CMAKE_GENERATOR "Unix Makefiles")
set(CPACK_COMPONENT_LIBS_REQUIRED "TRUE")
set(CPACK_COMPONENT_UNSPECIFIED_HIDDEN "TRUE")
set(CPACK_COMPONENT_UNSPECIFIED_REQUIRED "TRUE")
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "fbriol@groupcls.com")
set(CPACK_DEBIAN_PACKAGE_SHLIBDEPS "ON")
set(CPACK_DEFAULT_PACKAGE_DESCRIPTION_FILE "/opt/local/share/cmake-3.24/Templates/CPack.GenericDescription.txt")
set(CPACK_DEFAULT_PACKAGE_DESCRIPTION_SUMMARY "fes built using CMake")
set(CPACK_GENERATOR "TXZ")
set(CPACK_IGNORE_FILES ".git.*;.vscode;build/")
set(CPACK_INSTALLED_DIRECTORIES "/Users/davidtrossman/Documents/Code/rads/altim/src/tides/fes-2.9.3-Source;/")
set(CPACK_INSTALL_CMAKE_PROJECTS "")
set(CPACK_INSTALL_PREFIX "/usr/local")
set(CPACK_MODULE_PATH "/Users/davidtrossman/Documents/Code/rads/altim/src/tides/fes-2.9.3-Source/cmake;;")
set(CPACK_NSIS_DISPLAY_NAME "fes 2.9.4")
set(CPACK_NSIS_INSTALLER_ICON_CODE "")
set(CPACK_NSIS_INSTALLER_MUI_ICON_CODE "")
set(CPACK_NSIS_INSTALL_ROOT "$PROGRAMFILES")
set(CPACK_NSIS_PACKAGE_NAME "fes 2.9.4")
set(CPACK_NSIS_UNINSTALL_NAME "Uninstall")
set(CPACK_OSX_SYSROOT "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX13.0.sdk")
set(CPACK_OUTPUT_CONFIG_FILE "/Users/davidtrossman/Documents/Code/rads/altim/src/tides/fes-2.9.3-Source/build/CPackConfig.cmake")
set(CPACK_PACKAGE_DEFAULT_LOCATION "/")
set(CPACK_PACKAGE_DESCRIPTION_FILE "/opt/local/share/cmake-3.24/Templates/CPack.GenericDescription.txt")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "fes built using CMake")
set(CPACK_PACKAGE_FILE_NAME "fes-2.9.4-Source")
set(CPACK_PACKAGE_INSTALL_DIRECTORY "fes 2.9.4")
set(CPACK_PACKAGE_INSTALL_REGISTRY_KEY "fes 2.9.4")
set(CPACK_PACKAGE_NAME "fes")
set(CPACK_PACKAGE_RELOCATABLE "true")
set(CPACK_PACKAGE_VENDOR "CNES/CLS/LEGOS")
set(CPACK_PACKAGE_VERSION "2.9.4")
set(CPACK_PACKAGE_VERSION_MAJOR "2")
set(CPACK_PACKAGE_VERSION_MINOR "9")
set(CPACK_PACKAGE_VERSION_PATCH "4")
set(CPACK_RESOURCE_FILE_LICENSE "/opt/local/share/cmake-3.24/Templates/CPack.GenericLicense.txt")
set(CPACK_RESOURCE_FILE_README "/opt/local/share/cmake-3.24/Templates/CPack.GenericDescription.txt")
set(CPACK_RESOURCE_FILE_WELCOME "/opt/local/share/cmake-3.24/Templates/CPack.GenericWelcome.txt")
set(CPACK_RPM_PACKAGE_SOURCES "ON")
set(CPACK_SET_DESTDIR "OFF")
set(CPACK_SOURCE_GENERATOR "TXZ")
set(CPACK_SOURCE_IGNORE_FILES ".git.*;.vscode;build/")
set(CPACK_SOURCE_INSTALLED_DIRECTORIES "/Users/davidtrossman/Documents/Code/rads/altim/src/tides/fes-2.9.3-Source;/")
set(CPACK_SOURCE_OUTPUT_CONFIG_FILE "/Users/davidtrossman/Documents/Code/rads/altim/src/tides/fes-2.9.3-Source/build/CPackSourceConfig.cmake")
set(CPACK_SOURCE_PACKAGE_FILE_NAME "fes-2.9.4-Source")
set(CPACK_SOURCE_TOPLEVEL_TAG "Darwin-Source")
set(CPACK_STRIP_FILES "")
set(CPACK_SYSTEM_NAME "Darwin")
set(CPACK_THREADS "1")
set(CPACK_TOPLEVEL_TAG "Darwin-Source")
set(CPACK_WIX_SIZEOF_VOID_P "8")

if(NOT CPACK_PROPERTIES_FILE)
  set(CPACK_PROPERTIES_FILE "/Users/davidtrossman/Documents/Code/rads/altim/src/tides/fes-2.9.3-Source/build/CPackProperties.cmake")
endif()

if(EXISTS ${CPACK_PROPERTIES_FILE})
  include(${CPACK_PROPERTIES_FILE})
endif()
