name             'java-buildpack-vm'
maintainer       'Mark Alston'
maintainer_email 'marktalston@gmail.com'
license          'All rights reserved'
description      'Installs/Configures java-buildpack-vm'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'java'
depends 'chef-sugar', '~> 1.2'
#depends 'apt'
#depends 'yum'
depends 'rbenv'

supports 'centos'
#supports 'ubuntu'