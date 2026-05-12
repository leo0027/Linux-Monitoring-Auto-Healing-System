#!/bin/bash

LOGFILE="/home/student/linux-auto-healing-system/logs/monitor.log"

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}')
MEM=$(free | awk '/Mem/ {printf("%.2f"), $3/$2 * 100}')
DISK=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

echo "=============================" >> $LOGFILE
echo "Monitoring Time: $(date)" >> $LOGFILE

echo "CPU Usage: $CPU%" >> $LOGFILE
echo "Memory Usage: $MEM%" >> $LOGFILE
echo "Disk Usage: $DISK%" >> $LOGFILE

#Disk Alert
if [ $DISK -gt 80 ]
then
    echo "WARNING: Disk Usage Above 80%" >> $LOGFILE
fi

#Apache Monitoring
systemctl is-active --quiet httpd

if [ $? -ne 0 ]
then
    echo "Apache Service Down - Restarting" >> $LOGFILE
    systemctl restart httpd
    echo "Apache Restarted Successfully" >> $LOGFILE
else
    echo "Apache Service Running" >> $LOGFILE
fi

#SSH Monitoring
systemctl is-active --quiet sshd

if [ $? -ne 0 ]
then
    echo "SSH Service Down - Restarting" >> $LOGFILE
    systemctl restart sshd
    echo "SSH Restarted Successfully" >> $LOGFILE
else
    echo "SSH Service Running" >> $LOGFILE
fi
