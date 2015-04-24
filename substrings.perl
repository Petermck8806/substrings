use strict;
use warnings;

sub read_strings{
	my $filename = shift @_;

	open(my $file_handle, "<", $filename) || die "Couldn't open '".$filename."' for reading because: ". $!;

	my @lines = undef;
	chomp(@lines = <$file_handle>);

	close $file_handle;

	return @lines;
}

sub evaluate_string{
	my $sequence = shift @_;

	return index($sequence, 'peter') != -1;
}

sub evaluate_occurrences{
	my @string_arr = @_;
	my $match_string = $_[1];
	my @ismatch = 0;
	my @occurrences = ();

	foreach my $a (@string_arr){
		if(evaluate_string($a)){
			push (@occurrences, $a);
		}
	}

	print "Occurrences: \n";
	foreach my $o (@occurrences){
		print $o . "\n";
	}

	return @occurrences;
}

sub evaluate_string_list{
	my @strings = @_;
	my $peter_string_count = 0;

	foreach $a (@strings){
		if(evaluate_string($a) ){
			$peter_string_count++;
		}  
	}

	my @results = evaluate_occurrences(@strings,'Peter');

	return $peter_string_count, @results;
}

my @string_list = read_strings("input.txt");
my $length = @string_list;

print "Strings to evaluate: [" . $length . "]\n\n";
my ($count, @result_string) = evaluate_string_list(@string_list);
print "Count of Strings containing Peter: [" . $count . "]\n\n";
print "Strings containing Peter:\n" . @result_string . "\n\n";


foreach my $i (@result_string){
	print $i . "\n\n";
}