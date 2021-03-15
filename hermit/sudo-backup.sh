BackupFolderPath=/home/hermit/Backups/
SiteLocation=/var/www/html
if [[ ! -d $BackupFolderPath ]]
then
    echo "$BackupFolderPath does not exist on your filesystem."
	mkdir $BackupFolderPath
fi
Date=$(date +%Y-%m-%d-%H-%M-%S)
tar -czvf $BackupFolderPath$Date.tar.gz $SiteLocation