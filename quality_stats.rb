#!/usr/bin/env ruby

require 'bio'

#This file accepts a fastq formatted file and returns the average, min, and max of the average quality of each read. 
#It also displays the minimum and maximum read length and statistics related to the expected error (avg, min, max).

# Variable holding the total number of reads 
totalReads  = 0
# Variables holding the quality stats 
totalQual   = 0.0
averageQual = 0.0
minQual     = 1000.0
maxQual     = 0.0
# Variables holding the length stats
minRead = 20000
maxRead = 0
# Variables holding the EE stats
totalEE = 0.0
avgEE = 0
minEE = 100000.0
maxEE = 0.0

#This better be a fastq file
qual = Bio::FlatFile.auto(ARGV[0])
qual.each do |q|
	totalReads += 1
	qual_scores_array = q.qualities
  	if qual_scores_array.empty?
  		next
  	else
  		currQual = qual_scores_array.reduce(:+).to_f / qual_scores_array.size
    	#abort("#{q.definition}, #{qual_scores_array}") unless currQual.nan? != true
  		totalQual += currQual

  		minQual = currQual if currQual < minQual
  		maxQual = currQual if currQual > maxQual

 		minRead = qual_scores_array.size if qual_scores_array.size < minRead
  		maxRead = qual_scores_array.size if qual_scores_array.size > maxRead
  		#abort("#{q.definition}, #{qual_scores_array}") unless minRead > 1
	
		readsumEE = 0.0
		qual_scores_array.each_with_index do |each_qual, ind|
			currEE = 10**(-each_qual.to_f/10)
			readsumEE += currEE
		end
		totalEE += readsumEE
		minEE = readsumEE if readsumEE < minEE
  		maxEE = readsumEE if readsumEE > maxEE
  	end
end

#puts totalQual
averageEE = totalEE/totalReads
averageQual = totalQual/totalReads

puts "Total reads:                    #{totalReads}"
puts "Total Average quality:          #{averageQual}"
puts "Minimum Read Quality:           #{minQual}"
puts "Maximum Read Quality:           #{maxQual}"
puts "Minimum Read Length:            #{minRead}"
puts "Maximum Read Length:            #{maxRead}"
puts "Total Average Expected Error:   #{averageEE}"
puts "Minimum Expected Error:         #{minEE}"
puts "Maximum Expected Error:         #{maxEE}"

