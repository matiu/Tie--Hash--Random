#
#===============================================================================
#         FILE:  random.t
#      CREATED:  07/05/2009 10:27:19 PM
#===============================================================================

use strict;
use warnings;

use Test::More;
use lib qw( ./lib ../lib  );
use Tie::Hash::Random;
use Scalar::Util qw(looks_like_number);

my %hash;
tie %hash, 'Tie::Hash::Random';

my $a_random_number           = $hash{foo};

ok (looks_like_number($a_random_number), "$a_random_number is a number");

my $an_other_random_number    = $hash{bar};
ok (looks_like_number($an_other_random_number), "$an_other_random_number is a number");

ok ( $a_random_number == $hash{foo}, "random numbers seems to be stored");


$hash{pepe} = 1234;
ok ( $hash{pepe} == 1234, "given numbers seems to be stored");

my %hash2;
tie %hash2, 'Tie::Hash::Random', { only_int => 1, min=>10, max=>100000 };

my $a_random_number2           = $hash{foo};
ok (looks_like_number($a_random_number2), "$a_random_number2 is a number");



done_testing;


