#Processing RNA sequencing Data on Whovian  using Kallisto 

#Step 1: Download Kallisto onto Whovian
Download the latest linux version from the kallisto github archive (Note: Do not need source)
https://pachterlab.github.io/kallisto/download
*Unzip and instasll Kallisto onto whovian:*
tar -xf v0.4*
cd kallisto-*
*Make a build directory and move to it*
mkdir build
cd build
*Note: You need to have CMAKE and HDF5 installed on whovian as well. more details can be found here:https://pachterlab.github.io/kallisto/local_build.html
cmake -DCMAKE_INSTALL_PREFIX=$HOME ..
make
make install
*You will now have kallisto in $HOME/bin/kallisto*
*You need to change your bash.rc profile so that kallisto always loads*
**Open bash profile**
