class {'windows_ad':
      install                => present,
      installmanagementtools => true,
      restart                => true,
      installflag            => true,
      configure              => present,
      configureflag          => true,
      domain                 => 'forest',
      domainname             => 'adtsys.local',
      netbiosdomainname      => 'adtsys',
      domainlevel            => '6',
      forestlevel            => '6',
      databasepath           => 'c:\\windows\\ntds',
      logpath                => 'c:\\windows\\ntds',
      sysvolpath             => 'c:\\windows\\sysvol',
      installtype            => 'domain',
      dsrmpassword           => '1P@ssw0rD1337',
      installdns             => 'yes',
      localadminpassword     => '1P@ssw0rD1337',
    }

     windows_ad::user{'Add_user':
      ensure               => present,
      domainname           => 'adtsys.local',
      path                 => 'OU=USERS,DC=ADTSYS,DC=LOCAL',
      accountname          => 'diegolima',
      lastname             => 'Lima',
      firstname            => 'Diego',
      passwordneverexpires => true,
      passwordlength       => 15,
      password             => 'M1Gr3atP@ssw0rd',
      emailaddress         => 'diego.lima@adtsys.com.br',
    }

     windows_ad::user{'Add_user':
      ensure               => present,
      domainname           => 'adtsys.local',
      path                 => 'OU=USERS,DC=ADTSYS,DC=LOCAL',
      accountname          => 'andreyevdias',
      lastname             => 'Dias',
      firstname            => 'Andreyev',
      passwordneverexpires => true,
      passwordlength       => 15,
      password             => 'M1Gr3atP@ssw0rd',
      emailaddress         => 'andreyev.dias@adtsys.com.br',
    }

     windows_ad::group{'devops':
      ensure               => present,
      displayname          => 'DevOps',
      path                 => 'CN=Users,DC=ADTSYS,DC=LOCAL',
      groupname            => 'devops',
      groupscope           => 'Global',
      groupcategory        => 'Security',
      description          => 'desc group',
    }

    windows_ad::groupmembers{'devops':
      ensure    => present,
      groupname => 'devops',
      members   => '"diegolima","andreyevdias"',
    }

