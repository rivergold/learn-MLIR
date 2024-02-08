# MLIR_DIR="/home/hejing/r/project/learn-MLIR/3rdparty/llvm-project/build"

set(MLIR_DIR "/home/hejing/r/project/learn-MLIR/3rdparty/llvm-project/build")
# set(MLIR_CMAKE_DIR "/home/hejing/r/project/learn-MLIR/3rdparty/llvm-project/build/lib/cmake/mlir")

message("[Debug] MLIR_DIR=${MLIR_DIR}")

find_package(MLIR REQUIRED CONFIG PATHS ${MLIR_DIR})
list(APPEND CMAKE_MODULE_PATH "${MLIR_CMAKE_DIR}")
message("[Debug] MLIR_CMAKE_DIR=${MLIR_CMAKE_DIR}")
message("[Package] MLIR_INCLUDE_DIRS=${MLIR_INCLUDE_DIRS}")

find_package(LLVM REQUIRED COMPONENTS nvptx amdgpu)

include_directories(${LLVM_INCLUDE_DIRS})


include(TableGen) # required by AddMLIR
include(AddLLVM)
include(AddMLIR)

include_directories(${MLIR_INCLUDE_DIRS})
include_directories(${CMAKE_CURRENT_BINARY_DIR})

set(LLVM_TARGET_DEFINITIONS Ops.td)
mlir_tablegen(Dialect.h.inc -gen-dialect-decls)
mlir_tablegen(Dialect.cpp.inc -gen-dialect-defs)
mlir_tablegen(Ops.h.inc -gen-op-decls)
mlir_tablegen(Ops.cpp.inc -gen-op-defs)
add_public_tablegen_target(ToyCh2OpsIncGen)

add_executable(main main.cc)
add_dependencies(main ToyCh2OpsIncGen)