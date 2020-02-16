#!/bin/sh

# Setup Freshclam
for i in ScriptedUpdates PrivateMirror; do
	VAL=$(eval echo "\$$i")
	if [ "$VAL" != "" ]; then
		echo "$i $VAL" >>/etc/clamav/freshclam.conf
		fi
	done
echo -- Enabled Freshclam config:
cat /etc/clamav/freshclam.conf | sed -e 's/#.*$//' -e '/^$/d'
echo -- Starting Initial Freshclam Sync
freshclam
chown -R clamav:clamav /var/lib/clamav
echo -- Background Freshclam starting
freshclam -d &

#clamd

for i in MaxConnectionQueueLength StreamMaxLength MaxScanSize MaxFileSize MaxRecursion MaxFiles MaxEmbeddedPE MaxHTMLNormalize MaxHTMLNoTags MaxScriptNormalize MaxZipTypeRcg MaxPartitions MaxIconsPE PCREMatchLimit PCRERecMatchLimit PCREMaxFileSize BlockMax; do
	VAL=$(eval echo "\$$i")
	if [ "$VAL" != "" ]; then
		sed -i "s/^#$i .*$/$i $VAL/g" /etc/clamav/clamd.conf
		fi
	done
echo -- Enabled Clamd config:
cat /etc/clamav/clamd.conf | sed -e 's/#.*$//' -e '/^$/d'
echo -- Starting Clamd
exec clamd
