class ntp {
    package { "ntp":        ensure  => latest }
    package { "ntpdate":    ensure  => latest }

    file { "ntpconf":
        name    => "/etc/ntp.conf",
        content => template("ntp.conf.erb"),
        owner   => "root",
    }

    service { "ntp":
        require => Package[ntp],
        subscribe => File[ntpconf],
        enable  => true,
        ensure  => running,
    }
}
