#Processing RNA sequencing Data on Whovian  using Kallisto 
<br>
#Step 1: Download Kallisto onto Whovian
<br>A. Download the latest linux version from the kallisto github archive *(Note: Do not need source)*<br>
https://pachterlab.github.io/kallisto/download**
B. Unzip and install Kallisto onto whovian<br>
tar -xf v0.4*<br>
cd kallisto-*<br>
<br>
C. Make a build directory and move to it<br>
mkdir build<br>
cd build<br>
<br>
*Note: You need to have CMAKE and HDF5 installed on whovian as well. more details can be found here:https://pachterlab.github.io/kallisto/local_build.html*<br>
<br>
make<br>
make install<br>
You will now have kallisto in $HOME/bin/kallisto<br>
<br>
#Step 2: Create Index file for Pseudoalignment
based on what transcript you want (In my case, human GR 38).  This only needs to be done once <br>
<br>A: Download the FASTA file you are planning on using into kallisto folder
<br>B: Run kallisto index command to build the index (First part is the name you will call your index ile, 2nd part is whatever you called the fasta file you have <br>
kallisto index -i transcripts.idx transcripts.fasta.gz
<br> *Make a note of where this index file is generated, you will need it for step 3!*

#Step 3: Perform Pseudo aligment on Samples of interest
<br>First, go into the folder where all of your paired end fastq files are.  These files are hopefully structured in a way that is "SAMPLENAME_" "R1/R2" ".fastq" (i.e PTL_18_Pax_R1.fastq) to make this code work.  you will have to modify things slightly based on other sname structurings<br>
A: Create/Copy the bash script (pairedendquant.sh) and modify it for your needs<br>
-change the index file to where your index file is located <br>
-Copy a list of the sample names you want to align (without the R1 or R2 demarkation) and paste it into the first part of the script<br>
-verify that the demarkation for R1, R2 is the same<br>
-Change the number of cores/threads you want to use based on what is available on the server**<br>
B: Run the bash script using the following command: <br>
bash -x pairedendquant.sh <br>
C: Check out your runtimes using the "time_log.txt" file to see how changing # of bootstraps/cores changes things, and estimate how long you will wait for your files to run<br>
#Step 4: Generate master count file for kallisto output
**For this, follow the RMarkdown text in this repository.**





