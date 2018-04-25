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
    mode    => '0770',
  } ->
  file { "${homedir}/auth":
    ensure => directory,
    owner  => $owner,
    group  => $group,
    mode   => '0770',
  }
  file { "${homedir}/auth/svn.simple":
    ensure => directory,
    owner  => $owner,
    group  => $group,
    mode   => '0660',
  }
  file { "${homedir}/auth/svn.ssl.server":
    ensure => directory,
    owner  => $owner,
    group  => $group,
    mode   => '0770',
  }
}
