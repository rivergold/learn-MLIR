cmake_minimum_required(VERSION 3.7)

project(
  Learn-LLVM
  VERSION 1.0
  DESCRIPTION "Very nice project"
  LANGUAGES CXX)

file(GLOB SRCS "**/*.cc")
foreach(CUR_FILE ${SRCS})
  get_filename_component(CUR_NAME ${CUR_FILE} NAME_WLE)
  add_executable(${CUR_NAME} ${CUR_FILE})
endforeach()
