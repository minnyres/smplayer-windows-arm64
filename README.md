# smplayer-windows-arm64

[SMPlayer](https://www.smplayer.info/) is a free media player which uses [MPlayer](http://www.mplayerhq.hu/design7/info.html) and [MPV](https://mpv.io/) as the multimedia backend. This repository distributes SMPlayer binaries for Windows on ARM64 (WoA).

Please go to [releases](https://github.com/minnyres/smplayer-windows-arm64/releases) for the downloads.

## Settings
Until now we are only able to build MPV for WoA, so choose `mpv` as multimedia engine in `General`.

To enable hardware decoding, it is recommended to choose `d3d11va` in `Performance->Decoding->Hardware decoding`.
