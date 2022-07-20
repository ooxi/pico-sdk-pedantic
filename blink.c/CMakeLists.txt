cmake_minimum_required(VERSION 3.13)

# initialize pico-sdk from submodule
# note: this must happen before project()
include("../pico-sdk/pico_sdk_init.cmake")

project("blink.c")

# initialize the Raspberry Pi Pico SDK
pico_sdk_init()

add_executable("${PROJECT_NAME}" "")

target_sources(
	"${PROJECT_NAME}"
	PRIVATE
		"${CMAKE_CURRENT_LIST_DIR}/blink.c"
)

set_source_files_properties(
	"${CMAKE_CURRENT_LIST_DIR}/blink.c"
	PROPERTIES COMPILE_FLAGS
		-std=c17

		-Wall
		-Wextra
		-Werror
		-Wpedantic
)

# Add pico_stdlib library which aggregates commonly used features
target_link_libraries("${PROJECT_NAME}" pico_stdlib)

# create map/bin/hex/uf2 file in addition to ELF.
pico_add_extra_outputs("${PROJECT_NAME}")

