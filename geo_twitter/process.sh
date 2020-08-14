#!/bin/bash

for f in *zip;
do
    echo $f
    json_f=$(echo $f | sed "s?zip?json?")
    unzip $f
    cat $json_f | jq -c 'if (.tweet_locations[].country_code == "mx") then . else empty end' | uniq > ${json_f}.mx
    echo "Selected $(wc -l ${json_f}.mx)/$(wc -l $json_f) lines"
    rm $json_f
done
