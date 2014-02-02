package WWW::NHKProgram::Date;
use strict;
use warnings;
use utf8;
use Carp;

sub validate {
    my $date = shift;
    if ($date !~ /\d{4}-\d{2}-\d{2}/) {
        croak "Date must be hyphen separated. (e.g. 2014-02-14)";
    }
}

1;
