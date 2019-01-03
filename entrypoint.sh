#!/bin/sh

# Setup Freshclam
echo Updating Clamav
echo Enabled Freshclam config:
cat /etc/clamav/freshclam.conf | sed -e 's/#.*$//' -e '/^$/d'
freshclam
chown -R clamav:clamav /var/lib/clamav
freshclam -d &

#clamd

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
