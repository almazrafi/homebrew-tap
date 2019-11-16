class Fugen < Formula
  version '1.0.0-alpha.3'

  desc 'A Swift command line tool to generate code from Figma files'
  homepage 'https://github.com/almazrafi/Fugen'
  head 'https://github.com/almazrafi/Fugen.git'
  url "https://github.com/almazrafi/Fugen/archive/#{version}.tar.gz"
  sha256 '776bac2ab82faf5e499a8273acea853bc5e337d271545b8d55e5e72b9c9082d2'

  depends_on :xcode => ['10.2', :build]

  def install
    system 'make', 'install', "PREFIX=#{prefix}"
  end
end
