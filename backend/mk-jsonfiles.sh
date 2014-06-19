#!/bin/sh
dbdir=../../nisp-tools/src/standards
saxon91 -o ../data/standards-all.json $dbdir/standards.xml get-standards-all.xsl
saxon91 -o ../data/profiles-all.json $dbdir/standards.xml get-profiles-all.xsl
saxon91 -o ../data/history.json $dbdir/standards.xml get-history.xsl
saxon91 -o ../data/standards-mandatory.json $dbdir/standards.xml get-select.xsl mode=Mandatory
saxon91 -o ../data/standards-emerging.json $dbdir/standards.xml get-select.xsl mode=Emerging
saxon91 -o ../data/standards-fading.json $dbdir/standards.xml get-select.xsl mode=Fading
