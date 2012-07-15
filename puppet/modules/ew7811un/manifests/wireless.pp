
class ew7811un::wireless {

  file { '/lib/modules/3.1.9+/kernel/net/wireless/8192cu.ko':
    source => 'files/lib/modules/3.1.9+/kernel/net/wireless/8192cu.ko',
    ensure => present,
    mode   => 644,
    notify => Exec['/sbin/depmod -a']
  }

  exec { '/sbin/depmod -a':
  }

  file { '/etc/modprobe.d/blacklist.conf':
    source => 'files/etc/modprobe.d/blacklist.conf',
    ensure => present,
    mode   => 644
  }

  file { '/etc/modules':
    source => 'files/etc/modules',
    ensure => present,
    mode   => 644
  }

  file { '/etc/wpa_supplicant.conf':
    source => 'files/etc/wpa_supplicant.conf',
    ensure => present,
    mode   => 644
  }

  file { '/etc/network/interfaces':
    source => 'files/etc/network/interfaces',
    ensure => present,
    mode   => 644
  }
}
