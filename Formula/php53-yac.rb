require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php53Yac < AbstractPhp53Extension
  init
  homepage 'https://github.com/laruence/yac'
  url 'https://github.com/laruence/yac.git', :branch => 'master'
  head 'https://github.com/laruence/yac.git'
  version 'latest'

  def install
    ENV.universal_binary if build.universal?

    safe_phpize
    system "./configure", "--prefix=#{prefix}",
                          phpconfig
    system "make"
    prefix.install %w(modules/yac.so)
    write_config_file if build.with? "config-file"
  end
end
