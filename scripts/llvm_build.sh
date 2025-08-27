#!/bin/bash

rm -f $PWD/llvm-project/llvm/CMakePresets.json
ln -s $PWD/scripts/CMakePresets.json $PWD/llvm-project/llvm/CMakePresets.json

pushd llvm-project

cmake --preset osx -S$PWD/llvm -B$PWD/build

# TODO: reduce cmake targets, only llvm & mlir libs

cmake --build $PWD/build --target all
# cmake --build $PWD/build --target install

popd

###############################################################################

# old log

# cmake --build ...
# ~ 4800 targets

###############################################################################
