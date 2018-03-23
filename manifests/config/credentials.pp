class svn::config::credentials_files (
  $owner = $svn::config::user,
  $group = $svn::config::group,
  $mode = '0600',
){
  file { "${homedir}/.subversion/auth/svn.simple":
    ensure => directory,
    owner  => $owner,
    group  => $group,
    mode   => $mode,
  }
}

# SVN client credentials
define svn::config::credentials(
  $realmstring,
  $username,
  $password,
  $owner = $svn::config::user,
  $group = $svn::config::group,
  $homedir = $svn::config::homedir,
  $mode = '0600',
  $hash = $name,
) {
  include svn::config::credentials_files
  
  file { "${homedir}/.subversion/auth/svn.simple/${hash}":
    owner   => $owner,
    group   => $group,
    mode    => $mode,
    content => template('svn/simpleauth.erb')
  }
}
