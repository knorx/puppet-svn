# Configuration of .subversion and auth
class svn::config(
  $user,
  $homedir="/home/${user}",
  $group=$user
) {

  file { "${homedir}/.subversion":
    ensure  => directory,
    owner   => $user,
    group   => $group,
    mode    => '0700',
    require => User[$user],
  } ->
  file { "${homedir}/.subversion/auth":
    ensure => directory,
    owner  => $user,
    group  => $group,
    mode   => '0700',
  }
  file { "${homedir}/.subversion/auth/svn.simple":
    ensure => directory,
    owner  => $user,
    group  => $group,
    mode   => '0600',
  }
  file { "${homedir}/.subversion/auth/svn.ssl.server":
    ensure => directory,
    owner  => $user,
    group  => $group,
    mode   => '0700',
  }
}
