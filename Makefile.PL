use IO::Socket;
use ExtUtils::MakeMaker;

#Lifted from Net::DNS
unlink 't/online.enabled';
eval {
    my $s = IO::Socket::INET->new(
        PeerAddr => "www.google.com:80",
        Timeout  => 10,
    );
    if ($s) {
        close($s);
        open( ENABLED, '>t/online.enabled' ) 
          or die "Can't touch ./t/online.enabled: $!";
        close(ENABLED) or die "Can't touch t/online.enabled: $!";
    }

};

WriteMakefile(
    'NAME'         => 'Tie::DNS',
    'VERSION_FROM' => 'lib/Tie/DNS.pm',
    'AUTHOR'       => 'Dana M. Diederich <dana@realms.org>',
    'ABSTRACT'     => 'Easy interface to Net::DNS',
    'dist'         => { COMPRESS => 'gzip', SUFFIX => 'gz' },
    'PREREQ_PM'    => {
        Net::DNS   => 0.12,
        Test::More => 0.01,
        Tie::Cache => 0.01,
    },
);
