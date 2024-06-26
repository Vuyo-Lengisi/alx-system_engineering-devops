#SSH client configuration
file_line { 'Turn off passwd auth':
  ensure => present,
  path   => '/etc/ssh/ssh_config',
  line   => 'PasswordAuthentication no',
}

file_line { 'Declare identity file':
  ensure => present,
  path   => '/etc/ssh/ssh_config',
  line   => 'IdentityFile ~/.ssh/school',
}

#Reloads SSH service if configuration changes
service { 'ssh':
  ensure  => running,
  enable  => true,
  require => File_line['Turn off passwd auth', 'Declare identity file'],
}
