class Gtkwave < Formula
  desc "GTKWave"
  homepage "https://gtkwave.sourceforge.net"
  license "GPL-2.0-or-later"
  head "https://github.com/gtkwave/gtkwave.git", branch: "master"
  revision 2

  depends_on "desktop-file-utils" => :build # for update-desktop-database
  depends_on "shared-mime-info" => :build
  depends_on "gobject-introspection" => :build
  depends_on "gtk-mac-integration" => :build
  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkg-config" => :build
  depends_on "gtk+3"

  patch do
	url "https://raw.githubusercontent.com/andylin2004/homebrew-gtkwave/main/macos_compat.diff"
	sha256 "8e403c115c4e27834df1b679aa5e427d3ddee7d5467b77c61d925843a05f5d4c"
	end

  def install
    ENV["DESTDIR"] = "/"
    system "meson", "setup", "build", *std_meson_args
    system "meson", "compile", "-C", "build", "--verbose"
    system "meson", "install", "-C", "build"
  end

end
