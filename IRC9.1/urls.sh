#!/bin/bash

declare -a urls=("https://www.cyberpuerta.mx" "https://www.youtube.com" "https://developers.redhat.com")

file=$(mktemp)

for url in "${urls[@]}"; do
    status=$(curl -m 10 -s -I "$url" | head -n 1 | awk '{print $2}')
    printf "%s,%s\n" "$url" "$status" >> "$file"
done

column -s, -t < "$file"
rm -f "$file"

