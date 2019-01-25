use strict;
use  warnings;

use Test::More tests => 4;

use_ok('Perl::Critic::Policy::InputOutput::ProhibitLogicalOperatorErrorHandling');

ok(my $policy = Perl::Critic::Policy::InputOutput::ProhibitLogicalOperatorErrorHandling->new());

isa_ok($policy, 'Perl::Critic::Policy::InputOutput::ProhibitLogicalOperatorErrorHandling');

can_ok($policy, qw(violates));
