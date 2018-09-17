# receed
This project will make remote code executions possible on remote machines with minimal setup. Not exactly for malicious purposes

<h1>Dweet Based</h1><br>
This script will keep running in the background, and keep checking the dweet page every 10 minutes (by default, this can be easily changed). If new commands are found, it will execute them and write a "Done=yes" to the dweet page to notify the user that the commands have been run<br>Use the following steps to use it<br>

<ol>
<li>Run the script as</li>
    ./dweet_puller.sh {dweet thing name}<br>
The dweet thing name can be anything, so go wild! Just make sure someone isn't already using it because there's NO authentication, so you might bother someone else or vice versa. My 2 cents, use the most unikely name you can think of
<li>Now open the dweet_pusher.html page in any web browser of your choice.</li>
<li>Click the "Set Dweet Thing" button, and enter the dweet thing name in the prompt box.</li>
<li>Now press the "Add Command" button as many times you want, it'll just add a new text field.</li>
<li>Now enter all your commands in the boxes, they'll be executed in the order.</li>
<li>Finally press the "Submit" button and you should be done.</li>
</ol>
Whenever the script will next check the dweet page, 
