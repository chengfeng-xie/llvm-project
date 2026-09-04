include_guard(GLOBAL)

block(PROPAGATE PIXI_ENV_DIR)
  get_property(in_try_compile GLOBAL PROPERTY IN_TRY_COMPILE)
  if(in_try_compile)
    if(NOT DEFINED PIXI_ENV_DIR)
      message(FATAL_ERROR)
    endif()
  else()
    set(PIXI_ENV_DIR "${CMAKE_CURRENT_SOURCE_DIR}/../.pixi/envs/default")
    if("${CMAKE_HOST_SYSTEM_NAME}" STREQUAL "Windows")
      cmake_path(APPEND PIXI_ENV_DIR Library
        OUTPUT_VARIABLE PIXI_ENV_DIR
      )
    endif()
  endif()
endblock()

list(APPEND CMAKE_TRY_COMPILE_PLATFORM_VARIABLES PIXI_ENV_DIR)
list(APPEND CMAKE_PREFIX_PATH "${PIXI_ENV_DIR}")

set(CMAKE_MSVC_RUNTIME_LIBRARY MultiThreaded)
