class Fugen < Formula
  version '1.1.1'

  desc 'A Swift command line tool to generate code from Figma files'
  homepage 'https://github.com/almazrafi/Fugen'
  head 'https://github.com/almazrafi/Fugen.git'
  url "https://github.com/almazrafi/Fugen/archive/#{version}.tar.gz"
  sha256 '5502b51a521ee37885723bca5116c32474cf9e100e7479384f0faba75c776620'

  depends_on :xcode => ['10.2', :build]

  def install
    system 'make', 'install', "PREFIX=#{prefix}"
  end
end
