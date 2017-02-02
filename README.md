## 1) quality_stats.b - For FASTQ files

###Introduction:

This script can be used to generate some general statistical counts like total number of reads, average quality, max and min quality, average expected error and max and min expected error. 

###Installation and Dependencies: 

Ruby gem bio is required for this script to function. Use the "gem install bio" command to install it.

###Usage: 

ruby quality_stats.rb [input_fastq_file]

###Arguments explained:
The only argument to be passed along with this script is the FASTQ file which needs to be analyzed.
Make sure the input file is in FASTQ format. 
Give the full path of the file along with the file name. 

###Output:
Total reads                   
Total Average quality          
Minimum Read Quality           
Maximum Read Quality         
Minimum Read Length           
Maximum Read Length           
Total Average Expected Error   
Minimum Expected Error        
Maximum Expected Error         
