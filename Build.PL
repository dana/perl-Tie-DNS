use Module::Build;
#copied shamelessly from Pod-PseudoPod-0.18/Build.PL
my $build = Module::Build->new (
    module_name => 'Tie::DNS',
    license => 'perl',
    build_requires => {
        'Test::More'    => 0,
        'Net::DNS'      => 0.12,
        'Tie::Cache'    => 0.01,
    },
    requires => {
        'Net::DNS'      => 0.12,
        'Tie::Cache'    => 0.01,
    },
    recursive_test_files => 1,
    dist_author          => 'Dana M. Diederich <dana@realms.org>',
    dist_abstract        => 'Easy interface to Net::DNS',
    script_files => [],
);
$build->create_build_script;
