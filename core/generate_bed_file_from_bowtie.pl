#!/usr/bin/perl
# generate_bed_file_from_bowtie.pl
# convert data files to BED format
# Takes bowtie output file as input

# THREE PARAMETERS
#	Parameter 1:  input file
#	Parameter 2:  true read length
#	Parameter 3:  fake read length (or padding size)

# INPUT FILE
#	Bowtie output file
#	File contains reads that mapped uniquely
#	Format:
#		One alignment per line; 8 tab-separated fields
#		1.  Name of read that aligned
#		2.  Reference strand aligned to, + for forward strand, - for reverse
#		3.  Name of reference sequence where alignment occurs, or numeric ID if no name was provided
#		4.  1-based offset into the forward reference strand where leftmost character of the alignment occurs
#		5.  Read sequence (reverse-complemented if orientation is -).
#		6.  ASCII-encoded read qualities (reversed if orientation is -). The encoded quality values are on the Phred scale and the encoding is ASCII-offset by 33 (ASCII char !).
#		7.  0  (NOTE FROM LEE:  because of the options we use, this is always 0)
#		8.  Comma-separated list of mismatch descriptors. If there are no mismatches in the alignment, this field is empty. A single descriptor has the format 
#			offset:reference-base>read-base. The offset is expressed as a 0-based offset from the high-quality (5') end of the read.

# OUTPUT FILE
#	Bed file
#	Contains monoclonal reads
#	Format:
#		6 tab-separated fields 
#		1.  chromosome
#		2.  start
#		3.  end
#		4.  label
#		5.  score
#		6.  strand

use strict;
use warnings;

my $inputfile;
my $outputfile;

my $padding;
my $start_padding;
my $end_padding;

my $line;
my @line_array;

my $location;
my $chromosome;
my $strand;
my $label;
my $start;
my $end;

my %read_hash;
my $hash_key;
my $hash_value;
my @hash_key_array;

my $read_counter = 0;
my $monoclonal_read_counter = 0;
my $formatted_read_counter;
my $formatted_monoclonal_read_counter;

my $temporary_percent;

unless (scalar @ARGV == 2)
{
        print STDERR "Usage: $0 BOWTIE_OUTPUT READ_LENGTH\n\n\tParameter 1: mapped reads (sam format)\n\tParameter 2: read length  (or padding size; e.g., 100)\n";
        exit(0);
}

$inputfile = $ARGV[0];
$padding = $ARGV[1];

if ($padding < 100)
{
	$start_padding = 0;
	$end_padding = $padding;
}
else
{
	$start_padding = $padding / 2;
	$end_padding = $padding / 2;
}

$outputfile = "$inputfile.bed";

open (INFILE, "<$inputfile") or die "couldn't open input file $inputfile\n";
open (OUTFILE, ">$outputfile") or die "couldn't open output file $outputfile\n";

print STDOUT "Processing $inputfile:\n";

while ($line = <INFILE>)
{
        $read_counter++;

        chomp($line);
        @line_array = split(/\t/,$line);


	$strand = $line_array[1];
	$chromosome = $line_array[2];

	$start = $line_array[3];
	$end = $start + $end_padding - 1;
	$start -= $start_padding;

	if ($start < 1)
	{
		$start = 1;
	}

	$hash_key = $chromosome . ":" . $start . ":" . $end . ":" . $strand;
	
	# Add it to the hash
	# Since the reads themselves might be duplicates, this might actually be incrementing a hash element instead of adding a new one
	$read_hash{$hash_key}++;
}

print STDOUT "Mapping results processed. Generating output file of unique, monoclonal hits...\n";

foreach $hash_key (keys(%read_hash))
{
	$monoclonal_read_counter++;
	$hash_value = $read_hash{$hash_key};
	@hash_key_array = split(/:/,$hash_key);

	$label = "Read" . $monoclonal_read_counter;

	# File format:  chromosome   start  end  label  score strand
	print OUTFILE $hash_key_array[0] . "\t"; 	# chromosome
	print OUTFILE $hash_key_array[1] . "\t";	# start
	print OUTFILE $hash_key_array[2] . "\t";	# end
	print OUTFILE $label . "\t";			# label
	print OUTFILE $hash_value . "\t";		# score (use the number of clonal copies of the read)
	print OUTFILE $hash_key_array[3] . "\n";	# strand
}

close INFILE;
close OUTFILE;

$formatted_read_counter = commify($read_counter);
$formatted_monoclonal_read_counter = commify($monoclonal_read_counter);

print STDOUT "\tThere were $formatted_read_counter reads.\n";

$temporary_percent = ($monoclonal_read_counter / $read_counter) * 100;
print STDOUT "\t\t$formatted_monoclonal_read_counter reads (";
printf("%.2f", $temporary_percent);
print STDOUT "%) were monoclonal\n";

print STDOUT "\nBed file is located in $outputfile\n";

sub commify
{
	my $input = shift;
	$input = reverse $input;
	$input =~ s/(\d\d\d)(?=\d)(?!\d*\.)/$1,/g;
	return reverse $input;
}

