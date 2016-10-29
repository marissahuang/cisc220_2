#!/bin/bash

# Marissa Huang - 10179169
# Deven Bernard - 10099810
# Keven Zuern - 10134425
# Quentin Petraroia - 10145835

# 01*** 1>> backupLogs file  

# $1 = path to the repository folder 
# $2 = github url
# $3 = github username
# $4 = github password

backupName=$(TZ='America/Toronto' date +%F%k | awk -F "-" '{print $1$2$3}')
tar cvf $backupName.tgz $1 1> /dev/null
echo "Backup " $backupName.tgz " created successfully!"
git pull -q https://$3:$4@$2 
git add --all $backupName.tgz 
git commit -qm "Backup " $backupName.tgz 
echo "Backup " $backupName.tgz " committed to the local git repository"
git push -q https://$3:$4@$2 --all
echo "Backup " $backupName.tgz " pushed to the remote git repository" $1






















