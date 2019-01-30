# NAME

Perl::Critic::Policy::InputOutput::ProhibitLogicalOperatorErrorHandling - prohibits logical error handling in open statements

# VERSION

This documentation describes version 0.01

# AFFILIATION

This policy has no affiliation

# DESCRIPTION

    open my $fh, '<', $file
            || die "Can't open '$file': $!"; # not okay

    open(my $fh, '<', $file)
        || die "Can't open '$file': $!"; # okay

    open my $fh, '<', $file
        or die "Can't open '$file': $!"; # okay

# CONFIGURATION AND ENVIRONMENT

This policy is not configurable at this time. Please see the TODO ["section"](#section).

# INCOMPATIBILITIES

This distribution holds no known incompatibilities at this time, please see ["DEPENDENCIES AND REQUIREMENTS"](#dependencies-and-requirements) for details on version requirements.

# BUGS AND LIMITATIONS

This distribution holds no known limitations or bugs at this time, please refer to the [the issue listing on GitHub](https://github.com/jonasbn/perl-critic-policy-regularexpressions-requiredefault/issues) for more up to date information.

# BUG REPORTING

Please report bugs via [GitHub](https://github.com/jonasbn/perl-critic-policy-regularexpressions-requiredefault/issues).

# TEST AND QUALITY

This distribution aims to adhere to the Perl::Critic::Policy standards and Perl best practices and recommendations.

# DEPENDENCIES AND REQUIREMENTS

This distribution requires:

- Perl 5.14
- Carp
- Readonly
- Perl::Critic::Policy
- Perl::Critic::Utils

Please see the listing in the file: `cpanfile`, included with the distribution for a complete listing and description for configuration, test and development.

# TODO

Ideas and suggestions for improvements and new features are listed in GitHub and are marked as `enhancement`.

- Please see [the issue listing on GitHub](https://github.com/jonasbn/perl-critic-policy-regularexpressions-requiredefault/issues)

# SEE ALSO

- [Blog post on Perl Hacks: A Subtle Bug](https://perlhacks.com/2019/01/a-subtle-bug/) by Dave Cross [@davorg](https://twitter.com/davorg)
- [Same Blog post on Medium: A Subtle Bug](https://culturedperl.com/a-subtle-bug-c9982f681cb8) by Dave Cross [@davorg](https://twitter.com/davorg)
- [Perl::Critic](https://metacpan.org/pod/Perl::Critic)
- [Perl::Critic::Policy::RegularExpressions::RequireExtendedFormatting](https://metacpan.org/pod/Perl::Critic::Policy::RegularExpressions::RequireExtendedFormatting)

# MOTIVATION

The motivation for this Perl::Critic policy came from a [Blog post on Perl Hacks: A Subtle Bug](https://perlhacks.com/2019/01/a-subtle-bug/) by Dave Cross [@davorg](https://twitter.com/davorg)

In the blog post Dave demonstrates a very subtle bug, which I think many Perl programmers have been or could be bitten by. But instead of searching through the code as a one time activity, I think this would do better as a Perl::Critic policy, so if the bug a some point was reintroduced in the code base it would be caught by Perl::Critic, if you use Perl::Critic that is - and you do use Perl::Critic right?

# AUTHOR

- jonasbn <jonasbn@cpan.org>

# ACKNOWLEDGEMENTS

- [Dave Cross (@davord)](https://twitter.com/jmaslak) / [DAVECROSS](https://metacpan.org/author/DAVECROSS) for the blog post sparking the idea for this policy, see link to blog post under ["MOTIVATION"](#motivation) or ["REFERENCES"](#references)

# LICENSE AND COPYRIGHT

Perl::Critic::Policy::InputOutput::ProhibitLogicalOperatorErrorHandling is (C) by jonasbn 2019

Perl::Critic::Policy::InputOutput::ProhibitLogicalOperatorErrorHandling is released under the Artistic License 2.0

Please see the LICENSE file included with the distribution of this module
