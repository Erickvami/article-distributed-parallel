#!/usr/bin/env perl6

use v6;

my @data = "experimentsResults.csv".IO.slurp.lines;

my @dims = <2 3 5 10 20 40>;
my %dimensions = (0..5).map: { $_ + 1 => @dims[$_] };
for @data[1..*] -> $l {
    my @columns = $l.split(",");
    my ($function,$algorithm) = @columns[0].split(" ");
    for %dimensions.keys -> $k {
	say "$function, $algorithm, ", %dimensions{$k}, ", ", @columns[$k];
    }
}
