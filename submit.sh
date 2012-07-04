#!/usr/bin/env bash

XML_FILE=`mktemp /tmp/jobXXXXXXXX`
NEOS_CLIENT=NEOS/NeosClient.py

echo "
<document>
<category>milp</category>
<solver>XpressMP</solver>
<inputType>GAMS</inputType>
<client>Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_4) AppleWebKit/536.11 (KHTML, like Gecko) Chrome/20.0.1132.34 Safari/536.11@24.90.15.4</client>
<priority>long</priority>
<email>nissan.pow@gmail.com</email>
<model><![CDATA[
" > $XML_FILE
cat color.gms >> $XML_FILE
echo "
]]></model>
<options><![CDATA[]]></options>
<gdx><![CDATA[]]></gdx>
<xpressemail><![CDATA[]]></xpressemail>
<comments><![CDATA[]]></comments>
</document>
" >> $XML_FILE

$NEOS_CLIENT $XML_FILE
