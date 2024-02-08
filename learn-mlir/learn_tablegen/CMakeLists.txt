set(MLIR_DIR "/home/hejing/r/project/learn-MLIR/3rdparty/llvm-project/build")
find_package(MLIR REQUIRED CONFIG HINTS ${MLIR_DIR})
message("[Debug] MLIR_CMAKE_DIR=${MLIR_CMAKE_DIR}")
message("[Debug] MLIR_INCLUDE_DIRS=${MLIR_INCLUDE_DIRS}")

list(APPEND CMAKE_MODULE_PATH "${MLIR_CMAKE_DIR}")
include(TableGen) # required by AddMLIR
include(AddLLVM)
include(AddMLIR)

include_directories(${MLIR_INCLUDE_DIRS})

set(LLVM_TARGET_DEFINITIONS toy.td)
mlir_tablegen(Dialect.h.inc -gen-dialect-decls)
mlir_tablegen(Dialect.cpp.inc -gen-dialect-defs)
add_public_tablegen_target(ToyCh2OpsIncGen)

add_executable(main main.cc)
add_dependencies(main ToyCh2OpsIncGen)
