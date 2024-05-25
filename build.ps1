$ErrorActionPreference = "Stop"

$env:path += ";$qt_install_dir\bin;"
$work_dir = $pwd

# mpv
# $mpv_version = '0.38.0'
# aria2c https://github.com/minnyres/mpv-windows-arm64/releases/download/v${mpv_version}/mpv_v${mpv_version}_arm64.7z
# 7z x mpv_v${mpv_version}_arm64.7z
# mv mpv packages

# sources
$smp_version = '24.5.0'
git clone --depth 1 https://github.com/smplayer-dev/smplayer-build.git
cd smplayer-build
git clone --depth 1 https://github.com/smplayer-dev/smplayer-themes.git packages\smplayer-themes
git clone --depth 1 https://github.com/smplayer-dev/smplayer-skins.git packages\smplayer-skins
git clone --depth 1 --branch v$smp_version  https://github.com/smplayer-dev/smplayer.git packages\smplayer-portable

# Compile themes
.\compile_themes.cmd

# Compile smplayer
cd packages/smplayer-portable
git apply $work_dir/smplayer.pro.patch
cd webserver
nmake -f .\Makefile.msc
cd ../src 
lrelease smplayer.pro
qmake "DEFINES += PORTABLE_APP" "CONFIG += release" "QMAKE_CXXFLAGS += -I$vcpkg_dir\installed\arm64-windows\include" "LIBS += -L$vcpkg_dir\installed\arm64-windows\lib"
jom
