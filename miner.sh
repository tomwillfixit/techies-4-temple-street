#!/bin/bash

#This will keep the mining rolling along by switching between 2 regions (eu and usa) when disconnects are detected 

region="eu"

#Start with default region

echo "Start Mining in Region ${region} : ./cpuminer -a cryptonight -o stratum+tcp://cryptonight.${region}.nicehash.com:3355"
./cpuminer -a cryptonight -o stratum+tcp://cryptonight.${region}.nicehash.com:3355 -u 1KW1jDtPrFDn4QCedtJgSsAz4BmtLN7ma.${worker_label} > miner.log &

pid=`echo $!`
echo "Initial PID: ${pid}"

while(true)
do

echo "Sleep for 30 seconds"
sleep 30
echo "Checking everything is ok"
number_of_errors=`grep -c "stratum_recv_line failed" miner.log`
echo "${number_of_errors} errors found"

if [ ${number_of_errors} -gt 3 ]; then
   echo "Too many connection errors detected"
   echo "Stop mining in Region ${region}. Stopping process ${pid}"
   kill ${pid} 
   wait ${pid}
   if [ ${region} == "eu" ]; then
       echo "Setting region to usa"
       region="usa"
   else
       echo "Setting region to eu"
       region="eu"
   fi
   echo "Start Mining in Region ${region} : ./cpuminer -a cryptonight -o stratum+tcp://cryptonight.${region}.nicehash.com:3355"
   ./cpuminer -a cryptonight -o stratum+tcp://cryptonight.${region}.nicehash.com:3355 -u 1KW1jDtPrFDn4QCedtJgSsAz4BmtLN7ma.${worker_label} > miner.log &
   pid=`echo $!`
else
   echo "Mining in progress"
   tail -25 miner.log
fi

done

