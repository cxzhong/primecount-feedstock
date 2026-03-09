set "CC=clang-cl.exe"
set "CXX=clang-cl.exe"

cmake -G Ninja %CMAKE_ARGS% ^
    -DBUILD_SHARED_LIBS=ON ^
    -DBUILD_STATIC_LIBS=OFF ^
    -DCMAKE_WINDOWS_EXPORT_ALL_SYMBOLS=ON ^
    -DBUILD_TESTS=ON ^
    -DBUILD_LIBPRIMESIEVE=OFF ^
    .

ninja install -j%CPU_COUNT%

ctest -j%CPU_COUNT% --output-on-failure
