# SVN ssl certificate
define svn::config::sslcert(
  $realmstring,
  $value,
  $owner = $svn::config::owner,
  $group = $svn::config::group,
  $homedir = $svn::config::homedir,
  $hash = $name,
) {
  file { "${homedir}/auth/svn.ssl.server/${hash}":
    owner   => $owner,
    group   => $group,
    mode    => '0600',
    content => template('svn/sslserver.erb')
  }
}
