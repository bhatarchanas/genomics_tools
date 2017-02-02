require 'bio'

# Variable holding the total number of reads 
totalReads  = 0
# Variables holding the CCS stats 
totalCCS   = 0
averageCCS = 0.0
minCCS     = 10000
maxCCS     = 0

#This better be a fastq file with the ccs counts in the header
qual = Bio::FlatFile.auto(ARGV[0])
qual.each do |q|
	totalReads += 1
	#puts q
	def_split = q.definition.split(";")
	ccs_part = def_split[2]
	#puts ccs_part
	ccs_count = ccs_part.split("=")[1].to_i
	#puts ccs_count
	totalCCS += ccs_count

	minCCS = ccs_count if ccs_count < minCCS
  	maxCCS = ccs_count if ccs_count > maxCCS
end

averageCCS = totalCCS.to_f/totalReads

puts "Total CCS count  : #{totalCCS}"
puts "Average CCS count: #{averageCCS}"
puts "Minimum CCS count: #{minCCS}"
puts "Maximum CCS count: #{maxCCS}"