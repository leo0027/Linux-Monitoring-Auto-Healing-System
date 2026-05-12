# Enterprise Linux Monitoring & Auto-Healing System

## Technologies
- RHEL 9
- Bash
- Ansible
- Cron
- systemd

## Features
- CPU Monitoring
- Memory Monitoring
- Disk Monitoring
- Apache Monitoring
- SSH Monitoring
- Auto-Healing
- Log Generation
- Automated Cleanup

## Run Project

chmod +x monitor.sh

./monitor.sh

## Cron Jobs

*/5 * * * * /root/linux-auto-healing-system/monitor.sh

0 1 * * * /root/linux-auto-healing-system/cleanup.sh
