#!/bin/bash

mkdir -p llvm-project && pushd llvm-project

git init

git remote add origin git@github.com:llvm/llvm-project.git
# git remote add origin https://gitcode.com/GitHub_Trending/ll/llvm-project.git
# git remote add origin /repo/llvm-project

######

git sparse-checkout set --no-cone \
  /cmake /llvm /mlir /lld /libunwind \
  '!/llvm/test' '!/llvm/unittests' '!/llvm/docs' \
  '!/mlir/test' '!/mlir/unittests' '!/mlir/docs' \
  '!/lld/test' \
  '/third-party/siphash' \
  /.vscode '/*.*' '!/.ci' '!/.github'

git sparse-checkout add \
  '!/llvm/utils/gn' \
  '!/llvm/lib/Target' '/llvm/lib/Target/*.*' \
  '/llvm/lib/Target/RISCV' '/llvm/lib/Target/ARM' '/llvm/lib/Target/AArch64' \
  '/llvm/lib/Target/AMDGPU' '/llvm/lib/Target/NVPTX' '/llvm/lib/Target/X86' \
  '/llvm/lib/Target/SPIRV' '/llvm/lib/Target/PowerPC'

git sparse-checkout add \
  '/llvm/docs' '/mlir/test' '/mlir/docs'

git sparse-checkout list

######

LLVM_SHA="27d654c4c4e6eb7c19e46af20500200e793da7c7"

git fetch --depth 1 origin $LLVM_SHA
# git checkout -b sync $LLVM_SHA
git checkout $LLVM_SHA

popd

###############################################################################
