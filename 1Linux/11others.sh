#!/bin/bash
#!/bin/bash

# Directory to back up
SRC_DIR="/var/log"

# Backup destination
DEST_DIR="/backup"

# Create backup directory if it doesn't exist
mkdir "$DEST_DIR"

# Timestamp
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Backup filename
BACKUP_FILE="$DEST_DIR/$TIMESTAMP.zip"

# Run the backup = zip -r <O/P zip filename> <destination to be compressed>
zip -r "$BACKUP_FILE" "$SRC_DIR" # You can also use tar command.

# Print result
echo "Backup created: $BACKUP_FILE"

#So, if SRC_DIR="/var/log" and timestamp is 20250818_133045, it will create something like: /backup/20250818_133045.zip containing everything under /var/log. ✅

# zip -r "$BACKUP_FILE" "$SRC_DIR" means:
#     1. zip = command to create a zip archive.
#     2. -r = recursive (include all subdirectories).
#     3. "$BACKUP_FILE" = the output zip file with timestamp.
#     4. "$SRC_DIR" = the directory you want to compress (in your case /var/log).

# On Linux .tar.gz is preferred over zip because it:
#     1. Compresses better and faster than zip
#     2. Preserves Linux file permissions, ownership, symlinks, etc.

# Tar code is = tar -cfz <O/P zip filename> <destination to be compressed ie .tar.gz>
# BACKUP_FILE="$DEST_DIR/log_backup_$TIMESTAMP.tar.gz" 
# tar -czf "$BACKUP_FILE" "$SRC_DIR" 

# In the above = 
#     1. .tar → A tarball (all files packed together, no compression) 
#     2. .gz → Gzip compression applied on top.
#     3. .tar.gz → A compressed tarball (very common on Linux/Unix).
#     4. tar -c → create archive
#     5. z → compress with gzip
#     6. f → specify filename

# To extract = 
#     1. unzip archive.zip -d /path/to/extract = -d specifies where to extract (if omitted, it extracts into the current directory).
#     2. tar -xzvf archive.tar.gz /path/to/extract = x is to extract