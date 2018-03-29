# Configuration of .subversion and auth
class svn::config(
  $user,
  $homedir="/home/${user}/.subversion",
  $group=$user,
  $owner=$user,
) {
  file { "${homedir}":
    ensure  => directory,
    owner   => $owner,
    group   => $group,
    mode    => '0700',
  } ->
  file { "${homedir}/auth":
    ensure => directory,
    owner  => $owner,
    group  => $group,
    mode   => '0700',
  }
  file { "${homedir}/auth/svn.simple":
    ensure => directory,
    owner  => $owner,
    group  => $group,
    mode   => '0600',
  }
  file { "${homedir}/auth/svn.ssl.server":
    ensure => directory,
    owner  => $owner,
    group  => $group,
    mode   => '0700',
  }
}
