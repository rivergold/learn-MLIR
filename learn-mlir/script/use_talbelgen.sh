llvm_dir="/home/hejing/r/project/learn-MLIR/3rdparty/llvm-project"
llvm_bin_dir="${llvm_dir}/build/bin"
mlir_src_dir="${llvm_dir}/mlir"

# ${llvm_bin_dir}/mlir-tblgen -gen-dialect-decls \
#     ${mlir_src_dir}/examples/toy/Ch2/include/toy/Ops.td -I ${mlir_src_dir}/include/

# ${llvm_bin_dir}/mlir-tblgen -gen-op-defs \
#     ${mlir_src_dir}/examples/toy/Ch2/include/toy/Ops.td -I ${mlir_src_dir}/include/

${llvm_bin_dir}/mlir-tblgen -gen-dialect-decls \
    ./Ops.td -I ${mlir_src_dir}/include/