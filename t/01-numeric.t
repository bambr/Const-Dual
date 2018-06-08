#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More tests => 25;
use Scalar::Util 'isdual';

use Const::Dual ();

use_ok('Const::Dual', A1 => 1, A2 => 2);
ok(eval { A1() }, "constant A1 exists");
ok(eval { A2() }, "constant A2 exists");
ok(eval { isdual A1() }, "constant A1 is dual");
ok(eval { isdual A2() }, "constant A2 is dual");
is(eval { int A1() },   1, "constant A1 num value");
is(eval { int A2() },   2, "constant A2 num value");
is(eval { A1()."" }, "A1", "constant A1 str value");
is(eval { A2()."" }, "A2", "constant A2 str value");

my %hash;
use_ok('Const::Dual', \%hash, A3 => 3, A4 => 4);
ok(eval { A3() }, "constant A3 exists");
ok(eval { A4() }, "constant A4 exists");
ok(eval { isdual A3() }, "constant A3 is dual");
ok(eval { isdual A4() }, "constant A4 is dual");
is(eval { int A3() },   3, "constant A3 num value");
is(eval { int A4() },   4, "constant A4 num value");
is(eval { A3()."" }, "A3", "constant A3 str value");
is(eval { A4()."" }, "A4", "constant A4 str value");
is_deeply([sort keys %hash ], [qw/A3 A4/], "storehash keys");
ok(isdual $hash{"A3"}, "storehash{A3} is dual");
ok(isdual $hash{"A4"}, "storehash{A4} is dual");
is(int $hash{"A3"},   3, "storehash{A3} num value");
is(int $hash{"A4"},   4, "storehash{A4} num value");
is($hash{"A3"}."", "A3", "storehash{A3} str value");
is($hash{"A4"}."", "A4", "storehash{A4} str value");