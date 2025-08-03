$ErrorActionPreference = "Stop"

$env:path += ";$qt_install_dir\bin;"
$work_dir = $pwd

# sources
$smp_version = '25.6.0'
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

# Install
$root = "$work_dir\smplayer-build\packages"
$output_dir = "$root\BUILD\smplayer-portable"
$smplayer_dir = "$root\smplayer-portable"
$smplayer_themes_dir = "$root\smplayer-themes"
$smplayer_skins_dir = "$root\smplayer-skins"

mkdir $output_dir
cd $output_dir
cp $smplayer_dir\src\release\smplayer.exe .
cp $smplayer_dir\*.txt .
cp $smplayer_dir\webserver\simple_web_server.exe .
cp $vcpkg_dir\installed\arm64-windows\bin\zlib*.dll
windeployqt --no-angle --no-opengl-sw smplayer.exe
rm vc_redist*.exe
cp $smplayer_dir\src\translations\*.qm translations
cp -r $smplayer_dir\src\shortcuts .
cp -r $smplayer_dir\docs .

# themes
mkdir themes
mkdir .\themes\Breeze
cp $smplayer_themes_dir\themes\Breeze\Breeze.rcc .\themes\Breeze\
cp $smplayer_themes_dir\themes\Breeze\README.txt .\themes\Breeze\

mkdir .\themes\Breeze-dark
cp $smplayer_themes_dir\themes\Breeze-dark\Breeze-dark.rcc .\themes\Breeze-dark\
cp $smplayer_themes_dir\themes\Breeze-dark\README.txt .\themes\Breeze-dark\

mkdir .\themes\Faenza
cp $smplayer_themes_dir\themes\Faenza\Faenza.rcc .\themes\Faenza\
cp $smplayer_themes_dir\themes\Faenza\README.txt .\themes\Faenza\

mkdir .\themes\Faenza-Darkest
cp $smplayer_themes_dir\themes\Faenza-Darkest\Faenza-Darkest.rcc .\themes\Faenza-Darkest\
cp $smplayer_themes_dir\themes\Faenza-Darkest\README.txt .\themes\Faenza-Darkest\

mkdir .\themes\Faenza-Silver
cp $smplayer_themes_dir\themes\Faenza-Silver\Faenza-Silver.rcc .\themes\Faenza-Silver\
cp $smplayer_themes_dir\themes\Faenza-Silver\README.txt .\themes\Faenza-Silver\

mkdir .\themes\Gartoon
cp $smplayer_themes_dir\themes\Gartoon\Gartoon.rcc .\themes\Gartoon\
cp $smplayer_themes_dir\themes\Gartoon\README.txt .\themes\Gartoon\

mkdir .\themes\Gnome
cp $smplayer_themes_dir\themes\Gnome\Gnome.rcc .\themes\Gnome\
cp $smplayer_themes_dir\themes\Gnome\README.txt .\themes\Gnome\

mkdir .\themes\Dark
cp $smplayer_themes_dir\themes\Dark\Dark.rcc .\themes\Dark\
cp $smplayer_themes_dir\themes\Dark\README.txt .\themes\Dark\
cp $smplayer_themes_dir\themes\Dark\style.qss .\themes\Dark\

mkdir .\themes\Masalla
cp $smplayer_themes_dir\themes\Masalla\Masalla.rcc .\themes\Masalla\
cp $smplayer_themes_dir\themes\Masalla\README.txt .\themes\Masalla\
cp $smplayer_themes_dir\themes\Masalla\style.qss .\themes\Masalla\

mkdir .\themes\Monochrome
cp $smplayer_themes_dir\themes\Monochrome\Monochrome.rcc .\themes\Monochrome\
cp $smplayer_themes_dir\themes\Monochrome\README.txt .\themes\Monochrome\

mkdir .\themes\Noia
cp $smplayer_themes_dir\themes\Noia\Noia.rcc .\themes\Noia\
cp $smplayer_themes_dir\themes\Noia\README.txt .\themes\Noia\

mkdir .\themes\Numix-remix
cp $smplayer_themes_dir\themes\Numix-remix\Numix-remix.rcc .\themes\Numix-remix\
cp $smplayer_themes_dir\themes\Numix-remix\README.txt .\themes\Numix-remix\

mkdir .\themes\Numix-uTouch
cp $smplayer_themes_dir\themes\Numix-uTouch\Numix-uTouch.rcc .\themes\Numix-uTouch\
cp $smplayer_themes_dir\themes\Numix-uTouch\README.txt .\themes\Numix-uTouch\

mkdir .\themes\Nuvola
cp $smplayer_themes_dir\themes\Nuvola\Nuvola.rcc .\themes\Nuvola\
cp $smplayer_themes_dir\themes\Nuvola\README.txt .\themes\Nuvola\

mkdir .\themes\Oxygen
cp $smplayer_themes_dir\themes\Oxygen\Oxygen.rcc .\themes\Oxygen\
cp $smplayer_themes_dir\themes\Oxygen\README.txt .\themes\Oxygen\

mkdir .\themes\Oxygen-Air
cp $smplayer_themes_dir\themes\Oxygen-Air\Oxygen-Air.rcc .\themes\Oxygen-Air\
cp $smplayer_themes_dir\themes\Oxygen-Air\README.txt .\themes\Oxygen-Air\

mkdir .\themes\Oxygen-KDE
cp $smplayer_themes_dir\themes\Oxygen-KDE\Oxygen-KDE.rcc .\themes\Oxygen-KDE\
cp $smplayer_themes_dir\themes\Oxygen-KDE\README.txt .\themes\Oxygen-KDE\

mkdir .\themes\Oxygen-Refit
cp $smplayer_themes_dir\themes\Oxygen-Refit\Oxygen-Refit.rcc .\themes\Oxygen-Refit\
cp $smplayer_themes_dir\themes\Oxygen-Refit\README.txt .\themes\Oxygen-Refit\

mkdir .\themes\Papirus
cp $smplayer_themes_dir\themes\Papirus\Papirus.rcc .\themes\Papirus\
cp $smplayer_themes_dir\themes\Papirus\README.txt .\themes\Papirus\

mkdir .\themes\PapirusDark
cp $smplayer_themes_dir\themes\PapirusDark\PapirusDark.rcc .\themes\PapirusDark\
cp $smplayer_themes_dir\themes\PapirusDark\README.txt .\themes\PapirusDark\

mkdir .\themes\Silk
cp $smplayer_themes_dir\themes\Silk\Silk.rcc .\themes\Silk\
cp $smplayer_themes_dir\themes\Silk\README.txt .\themes\Silk\

mkdir .\themes\Tango
cp $smplayer_themes_dir\themes\Tango\Tango.rcc .\themes\Tango\
cp $smplayer_themes_dir\themes\Tango\README.txt .\themes\Tango\

mkdir .\themes\blackPanther-Light
cp $smplayer_themes_dir\themes\blackPanther-Light\blackPanther-Light.rcc .\themes\blackPanther-Light\
cp $smplayer_themes_dir\themes\blackPanther-Light\README.txt .\themes\blackPanther-Light\

mkdir .\themes\blackPanther-Real
cp $smplayer_themes_dir\themes\blackPanther-Real\blackPanther-Real.rcc .\themes\blackPanther-Real\
cp $smplayer_themes_dir\themes\blackPanther-Real\README.txt .\themes\blackPanther-Real\

mkdir .\themes\blackPanther-VistaLike
cp $smplayer_themes_dir\themes\blackPanther-VistaLike\blackPanther-VistaLike.rcc .\themes\blackPanther-VistaLike\
cp $smplayer_themes_dir\themes\blackPanther-VistaLike\README.txt .\themes\blackPanther-VistaLike\

mkdir .\themes\ePapirus
cp $smplayer_themes_dir\themes\ePapirus\ePapirus.rcc .\themes\ePapirus\
cp $smplayer_themes_dir\themes\ePapirus\README.txt .\themes\ePapirus\

mkdir .\themes\Black
cp $smplayer_skins_dir\themes\Black\Black.rcc .\themes\Black\
cp $smplayer_skins_dir\themes\Black\main.css .\themes\Black\

mkdir .\themes\Gonzo
cp $smplayer_skins_dir\themes\Gonzo\Gonzo.rcc .\themes\Gonzo\
cp $smplayer_skins_dir\themes\Gonzo\main.css .\themes\Gonzo\

mkdir .\themes\Mac
cp $smplayer_skins_dir\themes\Mac\Mac.rcc .\themes\Mac\
cp $smplayer_skins_dir\themes\Mac\main.css .\themes\Mac\

mkdir .\themes\Modern
cp $smplayer_skins_dir\themes\Modern\Modern.rcc .\themes\Modern\
cp $smplayer_skins_dir\themes\Modern\main.css .\themes\Modern\

mkdir .\themes\Vista
cp $smplayer_skins_dir\themes\Vista\Vista.rcc .\themes\Vista\
cp $smplayer_skins_dir\themes\Vista\main.css .\themes\Vista\

mkdir .\themes\Mint-Y
cp $smplayer_skins_dir\themes\Mint-Y\Mint-Y.rcc .\themes\Mint-Y\
cp $smplayer_skins_dir\themes\Mint-Y\README.txt .\themes\Mint-Y\
cp $smplayer_skins_dir\themes\Mint-Y\main.css .\themes\Mint-Y\

# mpv
$mpv_version = '0.40.0'
cd ..
aria2c https://github.com/minnyres/mpv-windows-arm64/releases/download/v${mpv_version}/mpv_v${mpv_version}_arm64.7z
7z x mpv_v${mpv_version}_arm64.7z
mkdir $output_dir/mpv
cp mpv/bin/mpv.exe $output_dir/mpv
cp mpv/bin/vulkan*.dll $output_dir/mpv

7z a -mx9 smplayer-portable-$smp_version-arm64.7z smplayer-portable
mv smplayer-portable-$smp_version-arm64.7z $work_dir