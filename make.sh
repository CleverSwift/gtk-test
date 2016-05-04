#!/bin/sh
mkdir build && cd build && cmake .. && cmake --build . --target gtk-test && cd ..
