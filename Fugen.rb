class Fugen < Formula
  version '1.0.0-alpha.6'

  desc 'A Swift command line tool to generate code from Figma files'
  homepage 'https://github.com/almazrafi/Fugen'
  head 'https://github.com/almazrafi/Fugen.git'
  url "https://github.com/almazrafi/Fugen/archive/#{version}.tar.gz"
  sha256 '9173ee63f07edccc3f42acb41828321904bc08e2cc2f4dfe6cb8406a3ae31cfe'

  depends_on :xcode => ['10.2', :build]

  def install
    system 'make', 'install', "PREFIX=#{prefix}"
  end
end
