#!/bin/bash

find /root/linux-auto-healing-system/logs -name "*.log" -mtime +7 -delete

echo "Old Logs Deleted Successfully"
