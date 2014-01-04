name             "rbenv"
maintainer       "yosu"
maintainer_email "woodstock830@gmail.com"
license          "Apache 2.0"
description      "Installs rbenv"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"
recipe           "rbenv", "Empty recipe for including LWRPs"
recipe           "rbenv::example", "Install rbenv example"

supports 'centos', '= 6.4'
supports 'ubuntu', '= 12.04'
