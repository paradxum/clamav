#!/bin/sh

# Setup Freshclam
echo Updating Clamav
freshclam
chown -R clamav:clamav /var/lib/clamav
freshclam -d &

#clamd
# Variables to handle
#	StreamMaxLength
#	MaxDirectoryRecursion
#	PCREMaxFileSie
# MAX_SCAN_SIZE	Amount of data scanned for each file - Default 150M
#	MaxScanSize
# MAX_FILE_SIZE	Don't scan files larger than this size - Default 30M
#	MaxFileSize
# MAX_RECURSION	How many nested archives to scan - Default 10
#	MaxRecursion
# MAX_FILES	Number of files to scan withn archive - Default 15000
#	MaxFiles
# MAX_EMBEDDEDPE	Maximum file size for embedded PE - Default 10M
#	MaxEmbeddedPE
# MAX_HTMLNORMALIZE	Maximum size of HTML to normalize - Default 10M
#	MaxHTMLNormalize
# MAX_HTMLNOTAGS	Maximum size of Normlized HTML File to scan- Default 2M
#	MaxHTMLNoTags
# MAX_SCRIPTNORMALIZE	Maximum size of a Script to normalize - Default 5M
#	MaxScriptNormalize
# MAX_ZIPTYPERCG	Maximum size of ZIP to reanalyze type recognition - Default 1M
#	MaxZipTypeRcg
# MAX_PARTITIONS	How many partitions per Raw disk to scan - Default 128
#	MaxPartitions
# MAX_ICONSPE	How many Icons in PE to scan - Default 200
#	MaxIconsPE
# PCRE_MATCHLIMIT	Maximum PCRE Match Calls - Default 10000
#	
# PCRE_RECMATCHLIMIT	Maximum Recursive Match Calls to PCRE - Default 10000
echo Starting Clamd
exec clamd
