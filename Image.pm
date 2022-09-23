package Data::Image;

use strict;
use warnings;

use Mo qw(build is);
use Mo::utils qw(check_code check_length check_number check_required);

our $VERSION = 0.01;

has comment => (
	is => 'ro',
);

has id => (
	is => 'ro',
);

has url => (
	is => 'ro',
);

has url_cb => (
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check comment.
	check_length($self, 'comment', 1000);

	# Check id.
	check_number($self, 'id');

	# Check URL.
	check_length($self, 'url', 255);

	# Check URL callback.
	check_code($self, 'url_cb');

	return;
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

Data::Image - Data object for image.

=head1 SYNOPSIS

 use Data::Image;

 my $obj = Data::Image->new(%params);
 my $comment = $obj->comment;
 my $id = $obj->id;
 my $url = $obj->url;
 my $url_cb = $obj->url_cb;

=head1 METHODS

=head2 C<new>

 my $obj = Data::Image->new(%params);

Constructor.

Returns instance of object.

=over 8

=item * C<comment>

Image comment.
It's optional.
Default value is undef.

=item * C<id>

Image id.
It's optional.
Default value is undef.

=item * C<url>

URL of image.
It's optional.
Default value is undef.

=item * C<url_cb>

URL callback. To get URL from code.
It's optional.
Default value is undef.

=back

=head2 C<comment>

 my $comment = $obj->comment;

Get image comment.

Returns string.

=head2 C<id>

 my $id = $obj->id;

Get image id.

Returns number.

=head2 C<url>

 my $url = $obj->url;

Get URL of image.

Returns string.

=head2 C<url_cb>

 my $url_cb = $obj->url_cb;

Get URL callback.

Returns code.

=head1 EXAMPLE

=for comment filename=create_and_print_image.pl

 use strict;
 use warnings;

 use Data::Image;

 my $obj = Data::Commons::Image->new(
         'comment' => 'Michal from Czechia',
         'url' => 'https://upload.wikimedia.org/wikipedia/commons/a/a4/Michal_from_Czechia.jpg',
 );

 # Print out.
 print 'Comment: '.$obj->comment."\n";
 print 'URL: '.$obj->url."\n";

 # Output:
 # Comment: Michal from Czechia
 # URL: https://upload.wikimedia.org/wikipedia/commons/a/a4/Michal_from_Czechia.jpg

=head1 DEPENDENCIES

L<Mo>,
L<Mo::utils>.

=head1 REPOSITORY

L<https://github.com/michal-josef-spacek/Data-Image>

=head1 AUTHOR

Michal Josef Špaček L<mailto:skim@cpan.org>

L<http://skim.cz>

=head1 LICENSE AND COPYRIGHT

© 2022 Michal Josef Špaček

BSD 2-Clause License

=head1 VERSION

0.01

=cut
