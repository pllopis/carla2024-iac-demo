node default {
  # Ensure a user 'demo_user' is present with a home directory
  user { 'demo_user':
    ensure     => present,
    home       => '/home/demo_user',
    managehome => true,
  }

  # Ensure the /home/demo_user/.welcome file exists with specific content
  file { '/home/demo_user/.welcome':
    ensure  => file,
    content => "Welcome to the Puppet-managed system, demo_user!\n",
    owner   => 'demo_user',
    mode    => '0644',
    notify  => Exec['notify_demo_user'],  # Trigger a task if the file content changes
  }

  # An example task that runs when the .welcome file changes
  exec { 'notify_demo_user':
    command     => '/bin/echo "Welcome file has been updated" >> /var/log/welcome.log',
    path        => ['/bin', '/usr/bin'],
    refreshonly => true,  # Only runs when triggered by the file change
  }
}
