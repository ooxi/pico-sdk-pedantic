cmake_minimum_required(VERSION 3.22)

# initialize pico-sdk from submodule
# note: this must happen before project()
include("../pico-sdk/pico_sdk_init.cmake")

project("blink.c++")

# initialize the Raspberry Pi Pico SDK
pico_sdk_init()

add_executable("${PROJECT_NAME}" "")

target_sources(
	"${PROJECT_NAME}"
	PRIVATE
		"${CMAKE_CURRENT_LIST_DIR}/blink.c++"
)

set(	"CXX_COMPILE_OPTIONS"

	-std=c++20

	-Wall
	-Wextra
	-Werror
	-Wpedantic

	-Wnon-virtual-dtor
	-Wcast-align
	-Wunused
	-Woverloaded-virtual
	-Wdouble-promotion
	-Wformat=2
)

set_source_files_properties(
	"${CMAKE_CURRENT_LIST_DIR}/blink.c++"
	PROPERTIES COMPILE_OPTIONS
		"${CXX_COMPILE_OPTIONS}"
)

# Add pico_stdlib library which aggregates commonly used features
target_link_libraries("${PROJECT_NAME}" pico_stdlib)

# create map/bin/hex/uf2 file in addition to ELF.
pico_add_extra_outputs("${PROJECT_NAME}")

