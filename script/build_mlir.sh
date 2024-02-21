cd 3rdparty/llvm-project
mkdir -p build && cd build

# apt install -y ccache

pip install --user -r ../mlir/python/requirements.txt

cmake -G Ninja ../llvm \
    -DLLVM_ENABLE_PROJECTS=mlir \
    -DLLVM_BUILD_EXAMPLES=ON \
    -DLLVM_TARGETS_TO_BUILD="X86;NVPTX;AMDGPU" \
    -DCMAKE_BUILD_TYPE=Release \
    -DLLVM_ENABLE_ASSERTIONS=ON \
    -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -DLLVM_ENABLE_LLD=ON \
    -DLLVM_CCACHE_BUILD=ON \
    -DMLIR_INCLUDE_INTEGRATION_TESTS=ON \
    -DLLVM_ENABLE_RTTI=ON \
    -DMLIR_ENABLE_BINDINGS_PYTHON=ON \
    -DCMAKE_INSTALL_PREFIX="./install" >cmake.log 2>&1

# -DLLVM_USE_SANITIZER="Address;Undefined" \

cmake --build . --target check-mlir
