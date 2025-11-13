#!/bin/bash

mkdir -p llvm-project && pushd llvm-project

git init

git remote add origin git@github.com:llvm/llvm-project.git
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
  '/llvm/lib/Target/SPIRV' '/llvm/lib/Target/PowerPC' '/llvm/lib/Target/Xtensa'

git sparse-checkout list

######

LLVM_SHA="f6ded0be897e2878612dd903f7e8bb85448269e5"
# LLVM_SHA="dd14eb8242d756f7ac03d003effab289d8950adf"
# LLVM_SHA="69db050839d1bdc47d750287689c46b5417d235e"

git fetch --depth 1 origin $LLVM_SHA
# git checkout -b sync $LLVM_SHA
git checkout $LLVM_SHA

popd

###############################################################################
