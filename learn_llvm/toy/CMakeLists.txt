set(LLVM_HOME "/home/hejing/r/project/learn-MLIR/3rdparty/llvm/build-llvm/")
set(CMAKE_CXX_COMPILER ${LLVM_HOME}/bin/clang++)

find_package(LLVM REQUIRED HINTS ${LLVM_HOME})
llvm_map_components_to_libnames(llvm_libs core)

file(GLOB SRCS "*.cc")
foreach(CUR_FILE ${SRCS})
  get_filename_component(CUR_NAME ${CUR_FILE} NAME_WLE)
  add_executable(${CUR_NAME} ${CUR_FILE})
  target_include_directories(${CUR_NAME} PUBLIC ${LLVM_INCLUDE_DIRS})
  target_link_libraries(${CUR_NAME} PUBLIC ${llvm_libs})
endforeach()
