exec { "apt-update":
  command => "/usr/bin/apt-get update"
}

package { ["git", "mysql-server", "apache2", "php7.0", "php-pear", "php7.0-mysql", "libapache2-mod-php7.0"]:
	ensure => installed,
	require => Exec["apt-update"]
}


file { '/var/git':
    ensure => 'directory',
	mode    =>  0755,
	require => Package["git"]
}

file { '/var/git/instrack.git':
    ensure => 'directory',
	mode => 0755,
	require => File["/var/git"]
}

exec { "git-init":
	command => "/usr/bin/git init --bare",
	cwd => "/var/git/instrack.git",
	unless => "test -f config"
	require => File["/var/git/instrack.git"]
}
  
service { "apache2":
    ensure => running,
    enable => true,
    hasstatus => true,
    hasrestart => true,
    require => Package["apache2"]    
}

service { "mysql":
	ensure => running,
	enable => true,
	hasstatus => true,
	hasrestart => true,
	require => Package["mysql-server"]
}

file { "/var/www/html/info.php":
	content => '<?php phpinfo(); ?>',
    owner => "www-data",
    group => "www-data",
    mode => 0755,
    require => Package["apache2"]
}