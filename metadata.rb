name             'java-buildpack-vm'
maintainer       'Mark Alston'
maintainer_email 'marktalston@gmail.com'
license          'All rights reserved'
description      'Installs/Configures java-buildpack-vm'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'build-essential'
depends 'java'
depends 'rbenv'
depends 'git'

%w{ debian ubuntu centos redhat }.each do |os|
  supports os
end