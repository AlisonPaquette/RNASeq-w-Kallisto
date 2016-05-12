#Processing RNA sequencing Data on Whovian  using Kallisto 
<br>
#Step 1: Download Kallisto onto Whovian
<br>Download the latest linux version from the kallisto github archive (Note: Do not need source)<br>
https://pachterlab.github.io/kallisto/download
**Unzip and install Kallisto onto whovian:**<br>
tar -xf v0.4*<br>
cd kallisto-*<br>
**Make a build directory and move to it**<br>
mkdir build<br>
cd build<br>
*Note: You need to have CMAKE and HDF5 installed on whovian as well. more details can be found here:https://pachterlab.github.io/kallisto/local_build.html*<br>
:q

make<br>
make install<br>
**You will now have kallisto in $HOME/bin/kallisto**<br>
<br>
#Step 2: Generate FASTA file based on what transcript you want (In my case, human GR 38) <br>


