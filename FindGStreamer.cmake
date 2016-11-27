# Try to find GStreamer
# Released under MIT License by Kota Weaver
# Once done this will define
#  GSTREAMER_FOUND - System has GStreamer
#  GSTREAMER_INCLUDE_DIRS - The GStreamer include directories
#  GSTREAMER_LIBRARIES - The libraries needed to use GStreamer
#  GSTREAMER_DEFINITONS - Compiler switches required for using GStreamer

find_package(PkgConfig)
pkg_check_modules(PC_GSTREAMER QUIET gstreamer-1.0)
set(GSTREAMER_DEFINITIONS ${PC_GSTREAMER_CFLAGS_OTHER})
find_path(GSTREAMER_INCLUDE_DIR gst/gst.h
  HINTS ${PC_GSTREAMER_INCLUDEDIR} ${PC_GSTREAMER_INCLUDE_DIRS})
find_path(GSTCONFIG_INCLUDE_DIR gst/gstconfig.h
  HINTS ${PC_GSTREAMER_INCLUDEDIR} ${PC_GSTREAMER_INCLUDE_DIRS})
message("gstconfig dir" ${PC_GSTREAMER_INCLUDE_DIRS})
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(GSTREAMER DEFAULT_MSG
  GSTREAMER_LIBRARY GSTREAMER_INCLUDE_DIR)
mark_as_advanced(GSTREAMER_INCLUDE_DIR GSTREAMER_LIBRARY GSTCONFIG_INCLUDE_DIR)
set(GSTREAMER_LIBRARIES ${GSTREAMER_LIBRARY})
set(GSTREAMER_INCLUDE_DIRS ${GSTREAMER_INCLUDE_DIR} ${GSTCONFIG_INCLUDE_DIR})
