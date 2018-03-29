# SVN client credentials
define svn::config::credentials(
  $realmstring,
  $username,
  $password,
  $owner = $svn::config::owner,
  $group = $svn::config::group,
  $homedir = $svn::config::homedir,
  $mode = '0600',
  $hash = $name,
) {
  file { "${homedir}/auth/svn.simple/${hash}":
    owner   => $owner,
    group   => $group,
    mode    => $mode,
    content => template('svn/simpleauth.erb')
  }
}
