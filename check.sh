#! /usr/bin/env bash

curlargs=" -s"

if [ $INSECURE -eq 1 ]; then
    curlargs="$curlargs -k"
fi

curlargs="$curlargs --url $URL"
web=`curl $curlargs | grep -iF "$PATTERN"`

if [[ ! $web ]]; then
    r=$(<"$FILE")
    if [ $((r * 1)) -gt $MAX_RETRY ]; then

        curl --location --request POST "https://api.pushover.net/1/messages.json" \
            --header "Content-Type: application/x-www-form-urlencoded" \
            --data-urlencode "token=$TOKEN" \
            --data-urlencode "user=$USER" \
            --data-urlencode "title=$TITLE" \
            --data-urlencode "message=$MESSAGE" \
            --data-urlencode "priority=$PRIO" \
            --data-urlencode "retry=$RETRY" \
            --data-urlencode "expire=$EXPIRE" \
            --data-urlencode "url=${URL}"
        exit 1
    else
        echo "pattern not found, retry in: $INTERVAL"
        echo $((r + 1)) > "$FILE"
        exit 0
    fi
fi

echo 0 > "$FILE"
echo "pattern found"
exit 0
