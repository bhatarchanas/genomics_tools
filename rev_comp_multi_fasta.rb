#!/usr/bin/env ruby

#Return the reverse complement of each record in a multi fasta file
#Usage: rev_comp_multi_fasta.rb

require 'bio'
ff = Bio::FastaFormat.open(ARGF)

ff.each_entry do |entry|
  puts ">" + entry.definition
  puts entry.naseq.complement
end
