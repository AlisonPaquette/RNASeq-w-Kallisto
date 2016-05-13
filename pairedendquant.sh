#########################################################################
#### Bash Script to Run paired end quantification on lots of samples###
#Written by Alison Paquette 5/10/2016
#Adapted from: https://benchtobioinformatics.wordpress.com/2015/07/10/using-kallisto-for-#gene-expression-analysis-of-published-rnaseq-data/
#
# program goal:
# for each fastq file
# 2. make output directory
# 3. start clock
# 4. run kallisto quantification on paired end reads
# 5. stop clock
# 6. calculate Kallisto run time and log to file
# # # # # # # # # # # # # # # # # # # # # # # # # # # # #
 
#Change this to the name of the index file you make!
INDEX="/local/apaquett/kallisto_linux-v0.42.5/GRCh38_83.idx"
 
# List of each fastq file you want
#declare -a arr=("CON_10_Pax" "CON_13_Pax" "CON_16_Pax" "CON_17_Pax" "CON_18_Pax" "CON_19_Pax" "CON_20_Pax" "CON_22_Pax" "CON_24_Pax" "CON_9_Pax" "CON_14_Pax" "CON_1_PAX" "CON_26_Pax" "CON_29_Pax" "CON_31_Pax" "CON_32_Pax" "CON_33_PAX" "CON_34_Pax" "CON_35_Pax" "CON_38_Pax" "CON_39_PAX" "Con_40_Pax" "CON_41_Pax" "CON_42_Pax" "CON_44_PAX" "CON_45_Pax" "CON_46_Pax" "CON_47_Pax" "CON_49_Pax" "CON_8_PAX" "PTL_10_Pax" "PTL_11_Pax" "PTL_12_Pax" "PTL_13_Pax" "PTL_14_Pax" "PTL_15_Pax" "PTL_17_Pax" "PTL_18_Pax" "PTL_19_Pax" "PTL_20_Pax" "PTL_3_Pax" "PTL_4_Pax" "PTL_5_Pax" "PTL_6_Pax" "PTL_9_Pax " "CON_10_Pax" "CON_13_Pax") 
for i in "${arr[@]}"
do
 mkdir output_"$i"
 start=`date +%s`
 kallisto quant -i $INDEX -b 100 -t 16 -o output_"$i" "$i""_R1.fastq" "$i""_R2.fastq"
 #Note: to change number of bootstraps -b, to change the number of cores -t
 end=`date +%s`
 runtime=$((end-start))
 echo "your runtime: $runtime seconds for sample $i" >> time_log.txt
done
