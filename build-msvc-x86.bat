@echo off
call "C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build\vcvarsall.bat" x86 >nul || exit /b 1
set "PATH=C:\Users\Clement\toolchains\meson-venv\Scripts;C:\VulkanSDK\1.4.321.1\Bin;%PATH%"
cd /d "%~dp0"
if not exist build.x86 (
  meson setup build.x86 --buildtype=release -Denable_d3d8=false -Denable_d3d10=false -Denable_d3d11=false -Denable_dxgi=false || exit /b 1
)
ninja -C build.x86 src/d3d9/d3d9.dll || exit /b 1
