## print-ip.sh

This short script gets the date, hostname and ip address of the server/computer and prints it over ssh to a CUPS printer

### Modify these VARS at the beginning of the file

    LOCATION => the ssh to your print server
    PRINTER => the name of the CUPS printer to print to
    FIRSTNUMBER => this is the first digits before the first . (ex: 192 or 10)

### crontab

    crontab -e

add following to print ip address when boot

    @reboot <full path to your file>/print-ip.sh

### built-in checks

the script check if the 'ip' command is installed, if not then use 'ifconfig' command.