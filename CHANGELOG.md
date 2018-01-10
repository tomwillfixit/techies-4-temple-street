## Updated to switch between regions and retry connections

In the previous version of the code, when a disconnect is detected, the cpu-miner would just keep failing to connect.  The miner.sh script was added to help with this.
The script will switch between 2 regions eu and usa when connection errors are detected and this will keep the mining running.  Over the past 3 weeks I've seen single 
regions become unavailable but never at the same time.  I'll update this properly to cycle through a list of regions but this works fine for now.
