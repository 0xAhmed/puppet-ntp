class ntp {
	
	package { "ntp" :
		ensure => installed,
 	}

	service { "ntpd" :
		ensure => running,
		enable => true,
		hasrestart => true,
		require => Package["ntp"]
	}
	
	
	file { "/etc/sysconfig/ntpd" :
		ensure => present,
		source => "puppet://$server/modules/ntp/ntpd",
		notify => Service["ntpd"]
	}
	
	file { "/etc/ntp.conf" :
		ensure => present,
		source => "puppet://$server/modules/ntp/ntp.conf",
		notify => Service["ntpd"]
	}
	
	exec { "Change timezone to Cairo" :
		command => "cp /usr/share/zoneinfo/Africa/Cairo /etc/localtime",
		path => "/usr/bin:/usr/sbin:/bin:/usr/local/bin",
	}
	
	
}