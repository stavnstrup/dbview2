#!/bin/sh
dbdir=../../nisp-tools/src/standards
mkdir ../data/standards
mkdir ../data/profiles
echo "Create all standards"
saxon91 -o ../data/standards-all.json $dbdir/standards.xml get-standards-all.xsl
echo "Create all profiles"
saxon91 -o ../data/profiles-all.json $dbdir/standards.xml get-profiles-all.xsl
echo "Create history"
saxon91 -o ../data/history.json $dbdir/standards.xml get-history.xsl
echo "Create mandatory standards"
saxon91 -o ../data/standards-mandatory.json $dbdir/standards.xml get-select.xsl mode=Mandatory
echo "Create emerging standards"
saxon91 -o ../data/standards-emerging.json $dbdir/standards.xml get-select.xsl mode=Emerging
echo "Create fading standards"
saxon91 -o ../data/standards-fading.json $dbdir/standards.xml get-select.xsl mode=Fading
echo "Create individual standards and profiles"
saxon91 $dbdir/standards.xml split-records.xsl
