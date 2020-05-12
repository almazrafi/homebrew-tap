class Fugen < Formula
  version '1.0.3'

  desc 'A Swift command line tool to generate code from Figma files'
  homepage 'https://github.com/almazrafi/Fugen'
  head 'https://github.com/almazrafi/Fugen.git'
  url "https://github.com/almazrafi/Fugen/archive/#{version}.tar.gz"
  sha256 'e234bf28fa9deef5b48c30bda3bc4b9b236cd633314b0e9f9238c12169cc8a6d'

  depends_on :xcode => ['10.2', :build]

  def install
    system 'make', 'install', "PREFIX=#{prefix}"
  end
end
