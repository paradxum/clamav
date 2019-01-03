#!/bin/sh

# Setup Freshclam
echo Updating Clamav
echo Enabled Freshclam config:
cat /etc/clamav/freshclam.conf | sed -e 's/#.*$//' -e '/^$/d'
freshclam
chown -R clamav:clamav /var/lib/clamav
freshclam -d &

#clamd
# MaxConnectionQueueLength	200	Max length the queue of pending connections can grow to.
# StreamMaxLength	25M	Max connection data size (match to MTA max attachment size)
# MaxScanSize		100M	Max amount of data to scan for each input file
# MaxFileSize		25M	Max File size to scan
# MaxRecursion		16	Max number of nested archive levels
# MaxFiles		10000	Max number of files to scan in an archive
# MaxEmbeddedPE		10M	Max file size for embedded PE
# MaxHTMLNormalize	10M	Max size of HTML file to normalize
# MaxHTMLNoTags		2M	Max size of a normalized HTML file to scan
# MaxScriptNormalize	5M	Max size of script file to normalize
# MaxZipTypeRcg		1M	Max size of ZIP to reanalyze type recognition
# MaxPartitions		50	Max partitions to scan for raw disk images
# MaxIconsPE		100	Max Icons in PE to scan
# PCREMatchLimit	100000	Max PCRE Match Calls
# PCRERecMatchLimit	5000	Max Recursive Match Calls to PCRE
# PCREMaxFileSize	25M	File size limit for PCRE subsigs
# BlockMax		No	Block files that exceed limits with "Heuristic.Limits.Exceeded"

for i in MaxConnectionQueueLength StreamMaxLength MaxScanSize MaxFileSize MaxRecursion MaxFiles MaxEmbeddedPE MaxHTMLNormalize MaxHTMLNoTags MaxScriptNormalize MaxZipTypeRcg MaxPartitions MaxIconsPE PCREMatchLimit PCRERecMatchLimit PCREMaxFileSize BlockMax; do
	VAL=$(eval echo "\$$i")
	if [ "$VAL" != "" ]; then
		sed -i "s/^#$i .*$/$i $VAL/g" /etc/clamav/clamd.conf
		fi
	done
echo Starting Clamd
echo Enabled Clamd config:
cat /etc/clamav/clamd.conf | sed -e 's/#.*$//' -e '/^$/d'
exec clamd
