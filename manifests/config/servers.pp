# SVN server
define svn::config::servers(
  $plaintext_passwords = false,
  $owner = $svn::config::owner,
  $group = $svn::config::group,
  $homedir = $svn::config::homedir,
) {
  if $plaintext_passwords {
    file { "${homedir}/servers":
      owner  => $owner,
      group  => $group,
      mode   => '0660',
      source => 'puppet:///modules/svn/servers',
    }
  }
}
