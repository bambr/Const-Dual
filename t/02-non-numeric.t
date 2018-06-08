#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More tests => 24;
use Scalar::Util 'isdual';

use Const::Dual ();

use_ok('Const::Dual', A1 => "string1", A2 => "string2");
ok(eval { A1() }, "constant A1 exists");
ok(eval { A2() }, "constant A2 exists");
ok(eval { not isdual A1() }, "constant A1 is not dual");
ok(eval { not isdual A2() }, "constant A2 is not dual");
is(eval { A1() }, "string1", "constant A1 value");
is(eval { A2() }, "string2", "constant A2 value");

my %hash;
use_ok('Const::Dual', \%hash, A3 => "string3", A4 => "string4");
ok(eval { A3() }, "constant A3 exists");
ok(eval { A4() }, "constant A4 exists");
ok(eval { not isdual A3() }, "constant A3 is not dual");
ok(eval { not isdual A4() }, "constant A4 is not dual");
is(eval { A3() }, "string3", "constant A3 str value");
is(eval { A4() }, "string4", "constant A4 str value");
is_deeply(\%hash, { A3 => "string3", A4 => "string4" }, "storehash");
ok(not(isdual $hash{"A3"}), "storehash{A3} is not dual");
ok(not(isdual $hash{"A4"}), "storehash{A4} is not dual");

use_ok('Const::Dual', A5 => { a => 5 }, A6 => [ a => 6 ]);
ok(eval { A5() }, "constant A5 exists");
ok(eval { A6() }, "constant A6 exists");
ok(eval { not isdual A5() }, "constant A5 is not dual");
ok(eval { not isdual A6() }, "constant A6 is not dual");
is_deeply(eval { A5() }, { a => 5 }, "constant A5 value");
is_deeply(eval { A6() }, [ a => 6 ], "constant A6 value");

