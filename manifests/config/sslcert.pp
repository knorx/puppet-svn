# SVN ssl certificate
define svn::config::sslcert(
  $ensure = present,
  Optional[String[1]] $realmstring = undef,
  Optional[String[1]] $value = undef,
  $owner = $svn::config::owner,
  $group = $svn::config::group,
  $homedir = $svn::config::homedir,
  $hash = $name,
) {
  if $ensure == present and (($realmstring == undef) or ($value == undef)) {
    fail('Realmstring and value are mandantory if ensure is present.')
  }
  file { "${homedir}/auth/svn.ssl.server/${hash}":
    ensure  => $ensure,
    owner   => $owner,
    group   => $group,
    mode    => '0660',
    content => template('svn/sslserver.erb')
  }
}
