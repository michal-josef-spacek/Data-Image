use strict;
use warnings;

use Data::Image;
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Test.
my $obj = Data::Image->new(
	'url' => 'https://upload.wikimedia.org/wikipedia/commons/a/a4/Michal_from_Czechia.jpg',
);
is($obj->size, undef, 'Get size (undef = default).');

# Test.
$obj = Data::Image->new(
	'size' => 1040304,
	'url' => 'https://upload.wikimedia.org/wikipedia/commons/a/a4/Michal_from_Czechia.jpg',
);
is($obj->size, 1040304, 'Get size (1040304).');
