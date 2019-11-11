#!/usr/bin/env perl6

use v6;

my @data = "experimentsResults.csv".IO.slurp.lines;

for @data -> $l {
    my @columns = $l.split(",");
    my ($function,$algorithm) = @columns[0].split(" ");
    say "$function, $algorithm, ", @columns[1..6].join(", ");
}
