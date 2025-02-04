{ pkgs ? import <nixpkgs> { } }:
with pkgs;
mkShell rec {
  nativeBuildInputs = [
    pkg-config
  ];
  buildInputs = [
    udev alsa-lib vulkan-loader
    xorg.libX11 xorg.libXcursor xorg.libXi xorg.libXrandr # To use the x11 feature
    libxkbcommon
    # libxkbcommon wayland # To use the wayland feature
  ];
  RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
  LD_LIBRARY_PATH = lib.makeLibraryPath buildInputs;
}
