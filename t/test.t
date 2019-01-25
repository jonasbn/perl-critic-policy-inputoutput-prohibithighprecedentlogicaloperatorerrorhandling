use strict;
use warnings;
use Test::More qw(no_plan);
use Env qw($TEST_VERBOSE);
use Data::Dumper;

use_ok 'Perl::Critic::Policy::InputOutput::ProhibitLogicalOperatorErrorHandling';

require Perl::Critic;
my $critic = Perl::Critic->new(
    '-profile'       => '',
    '-single-policy' => 'InputOutput::ProhibitLogicalOperatorErrorHandling'
);
{
    my @p = $critic->policies;
    is( scalar @p, 1, 'single policy InputOutput::ProhibitLogicalOperatorErrorHandling' );

    my $policy = $p[0];
}

# The bug
{
    my $str = q[
        open my $fh, '<', ($file
            || die "Can't open '$file': $!");
    ];

    my @violations = $critic->critique( \$str );

    is( scalar @violations, 1 );
}

# No bug - with parenthesis
{
    my $str = q[
        open(my $fh, '<', $file)
            || die "Can't open '$file': $!";
    ];

    my @violations = $critic->critique( \$str );

    is( scalar @violations, 0 );
}

# No bug - with or
{
    my $str = q[
        open my $fh, '<', $file
            or die "Can't open '$file': $!";
    ];

    my @violations = $critic->critique( \$str );

    is( scalar @violations, 0 );
}

# No bug - with or and parenthesis
{
    my $str = q[
        open(my $fh, '<', $file)
            || die "Can't open '$file': $!";
    ];

    my @violations = $critic->critique( \$str );

    is( scalar @violations, 0 );
}

exit 0;
