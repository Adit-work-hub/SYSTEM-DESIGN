#!/bin/bash

URL="http://127.0.0.1:8000/api/hello?name=Adit"

for requests in 10000
do
    echo "================================="
    echo "Testing with $requests requests"
    echo "================================="
    ab -n $requests -c 1000 "$URL"
done