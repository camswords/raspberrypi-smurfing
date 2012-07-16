
class ew7811un::wireless {

  file { '/lib/modules/3.1.9+/kernel/net/wireless/8192cu.ko':
    source => 'puppet:///modules/ew7811un/lib/modules/3.1.9+/kernel/net/wireless/8192cu.ko',
    ensure => present,
    mode   => 644,
    owner  => root,
    group  => root,
    notify => Exec['/sbin/depmod -a']
  }

  exec { '/sbin/depmod -a': }

  file { '/etc/modprobe.d/blacklist.conf':
    source => 'puppet:///modules/ew7811un/etc/modprobe.d/blacklist.conf',
    ensure => present,
    owner  => root,
    group  => root,
    mode   => 644
  }

  file { '/etc/modules':
    source => 'puppet:///modules/ew7811un/etc/modules',
    ensure => present,
    owner  => root,
    group  => root,
    mode   => 644
  }

  file { '/etc/wpa_supplicant.conf':
    source => 'puppet:///modules/ew7811un/etc/wpa_supplicant.conf',
    ensure => present,
    owner  => root,
    group  => root,
    mode   => 644
  }

  file { '/etc/network/interfaces':
    source => 'puppet:///modules/ew7811un/etc/network/interfaces',
    ensure => present,
    owner  => root,
    group  => root,
    mode   => 644
  }
}
