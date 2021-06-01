# NAME

Perl::Critic::Policy::InputOutput::ProhibitHighPrecedentLogicalOperatorErrorHandling - prohibits logical error handling in open statements

# VERSION

This documentation describes version: 0.02

# AFFILIATION

This policy has no affiliation

# DESCRIPTION

This policy addresses an anti-pattern and possible bug. If you use `open` combined with the high precedence logical or operator `||` for error handling.

If the file parameter is pointing to a non-existent file, the use of a high precedence logical operator `||`, does not short-cut as expected. This implies that the bug only is present if the file does not exist. If the file exists, but cannot be opened the error handling is not working as expected.

    open my $fh, '<', $file
            || die "Can't open '$file': $!"; # not okay

    open(my $fh, '<', $file)
        || die "Can't open '$file': $!"; # okay

    open my $fh, '<', $file
        or die "Can't open '$file': $!"; # okay

    open my $fh, "<$file"
            || die "Can't open '$file': $!"; # not okay

    open(my $fh, "<$file")
        || die "Can't open '$file': $!"; # okay

    open my $fh, "<$file"
        or die "Can't open '$file': $!"; # okay

The remedy is to use parentheses for `open` or the lower precedence logical operator `or`.

Alternatively, [autodie](https://metacpan.org/pod/autodie) can be used.

# CONFIGURATION AND ENVIRONMENT

This policy is not configurable at this time. Please see the TODO ["section"](#section).

# INCOMPATIBILITIES

Do note that this policy conflicts with the policy:

- [Perl::Critic::Policy::CodeLayout::ProhibitParensWithBuiltins](https://metacpan.org/pod/Perl::Critic::Policy::CodeLayout::ProhibitParensWithBuiltins)

# BUGS AND LIMITATIONS

This distribution holds no known limitations or bugs at this time, please refer to the [the issue listing on GitHub](https://github.com/jonasbn/perl-critic-policy-regularexpressions-requiredefault/issues) for more up to date information.

# BUG REPORTING

Please report bugs via [GitHub](https://github.com/jonasbn/perl-critic-policy-regularexpressions-requiredefault/issues).

# TEST AND QUALITY

This distribution aims to adhere to the Perl::Critic::Policy standards and Perl best practices and recommendations.

# DEPENDENCIES AND REQUIREMENTS

This distribution requires:

- Perl 5.6.0 syntactically for the actual implementation
- [Perl 5.14](https://metacpan.org/pod/release/JESSE/perl-5.14.0/pod/perl.pod) for developing the distribution, which relies on [Dist::Zilla](http://dzil.org/). The features on which this policy relies, where introduced in Perl 5.14, but this does not make for an actual requirement for the policy only the recommendations it imposes.
- [Carp](https://metacpan.org/pod/Carp), in core since Perl 5.
- [Readonly](https://metacpan.org/pod/Readonly)
- [Perl::Critic::Policy](https://metacpan.org/pod/Perl::Critic::Policy)
- [Perl::Critic::Utils](https://metacpan.org/pod/Perl::Critic::Utils)

Please see the listing in the file: `cpanfile`, included with the distribution for a complete listing and description for configuration, test and development.

# TODO

Ideas and suggestions for improvements and new features are listed in GitHub and are marked as `enhancement`.

- Please see [the issue listing on GitHub](https://github.com/jonasbn/perl-critic-policy-regularexpressions-requiredefault/issues)

# SEE ALSO

- [Blog post on Perl Hacks: A Subtle Bug](https://perlhacks.com/2019/01/a-subtle-bug/) by Dave Cross [@davorg](https://twitter.com/davorg)
- [Same Blog post on Medium: A Subtle Bug](https://culturedperl.com/a-subtle-bug-c9982f681cb8) by Dave Cross [@davorg](https://twitter.com/davorg)
- [Perl::Critic](https://metacpan.org/pod/Perl::Critic)

# MOTIVATION

The motivation for this Perl::Critic policy came from a [Blog post on Perl Hacks: A Subtle Bug](https://perlhacks.com/2019/01/a-subtle-bug/) by Dave Cross [@davorg](https://twitter.com/davorg)

In the blog post Dave demonstrates a very subtle bug, which I think many Perl programmers have been or could be bitten by. But instead of searching through the code as a one time activity, I think this would do better as a Perl::Critic policy, so if the bug a some point was reintroduced in the code base it would be caught by Perl::Critic, if you use Perl::Critic that is - and you do use Perl::Critic right?

# AUTHOR

- Jonas Brømsø (jonasbn) <jonasbn@cpan.org>

# ACKNOWLEDGEMENTS

- [Dave Cross (@davorg)](https://twitter.com/davorg) / [DAVECROSS](https://metacpan.org/author/DAVECROSS) for the blog post sparking the idea for this policy, see link to blog post under ["MOTIVATION"](#motivation) or ["REFERENCES"](#references)
- [Nathan Mills](https://github.com/Quipyowert2) for contributing to this policy, documenting and testing two-argument `open`

# LICENSE AND COPYRIGHT

Perl::Critic::Policy::InputOutput::ProhibitHighPrecedentLogicalOperatorErrorHandling is (C) by jonasbn 2019-2021

Perl::Critic::Policy::InputOutput::ProhibitHighPrecedentLogicalOperatorErrorHandling is released under the Artistic License 2.0

Please see the LICENSE file included with the distribution of this module
