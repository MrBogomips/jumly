exec {epel:
  command => "rpm -ivh http://ftp.riken.jp/Linux/fedora/epel/6/x86_64/epel-release-6-8.noarch.rpm",
  creates => "/etc/yum.repos.d/epel.repo",
  path    => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
}

package {
  [
    'git',
    'nodejs',
    'npm',
    ]:
  ensure  => present,
  require => Exec[epel],
}
