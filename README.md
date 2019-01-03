# clamav
Basic Clamav Docker image with Alpine

This runs a basic Clamd instance that listens on port 3310

## Environment variables Supported
| MaxConnectionQueueLength	| 200	| Max length the queue of pending connections can grow to. |
| StreamMaxLength	| 25M	| Max connection data size (match to MTA max attachment size) |
| MaxScanSize		| 100M	| Max amount of data to scan for each input file |
| MaxFileSize		| 25M	| Max File size to scan |
| MaxRecursion		| 16	| Max number of nested archive levels |
| MaxFiles		| 10000	| Max number of files to scan in an archive |
| MaxEmbeddedPE		| 10M	| Max file size for embedded PE |
| MaxHTMLNormalize	| 10M	| Max size of HTML file to normalize |
| MaxHTMLNoTags		| 2M	| Max size of a normalized HTML file to scan |
| MaxScriptNormalize	| 5M	| Max size of script file to normalize |
| MaxZipTypeRcg		| 1M	| Max size of ZIP to reanalyze type recognition |
| MaxPartitions		| 50	| Max partitions to scan for raw disk images |
| MaxIconsPE		| 100	| Max Icons in PE to scan |
| PCREMatchLimit	| 100000	| Max PCRE Match Calls |
| PCRERecMatchLimit	| 5000	| Max Recursive Match Calls to PCRE |
| PCREMaxFileSize	| 25M	| File size limit for PCRE subsigs |
| BlockMax		| No	| Block files that exceed limits with "Heuristic.Limits.Exceeded" |
