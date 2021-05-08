#!/bin/sh
RANGE="C3:I3"

cat <<EOF | rp | perl -pe 's/\s+//g'

IF (COUNTIF($RANGE, "yes*" )=7,
	   "Yes",
	   IF (COUNTIF($RANGE,"no*")>0,
		     "No",
		     IF (COUNTBLANK($RANGE)>0, "TBD", "Unclear")))
EOF

echo ""
