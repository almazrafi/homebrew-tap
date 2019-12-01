class Fugen < Formula
  version '1.0.0'

  desc 'A Swift command line tool to generate code from Figma files'
  homepage 'https://github.com/almazrafi/Fugen'
  head 'https://github.com/almazrafi/Fugen.git'
  url "https://github.com/almazrafi/Fugen/archive/#{version}.tar.gz"
  sha256 '081e34dddb6fec59d831fe3e883124382660c854d73edf1555453e3c4b4a1344'

  depends_on :xcode => ['10.2', :build]

  def install
    system 'make', 'install', "PREFIX=#{prefix}"
  end
end
