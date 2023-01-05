#!/bin/bash

# Set the base Gmail address as a variable
base_gmail="shahbaz"

# Set the starting number as a variable
start_num=1

# Set the ending number as a variable
end_num=10

# Loop through the numbers
for ((i=$start_num; i<=$end_num; i++)); do
  # Set the Gmail address as the base address plus the current number
  gmail_address=$base_gmail$i

  # Set the request body as a variable
  request_data='{
    "input01": {
        "Input": "GmailAddress",
        "GmailAddress": "'"$gmail_address"'",
        "FirstName": "Shahbaz",
        "LastName": "Ali"
    },
    "Locale": "en"
}'

  # Send the POST request and store the response
  response=$(curl --location --request POST 'https://accounts.google.com/b/0/InputValidator?resource=SignUp' \
  --header 'Content-Type: application/json' \
  --data-raw "$request_data" -s)

  # Check if the response indicates that the Gmail address is available
  if [[ $response =~ "\"Valid\":true" ]]; then
    echo "$gmail_address is available"
  else
    echo "$gmail_address is not available"
  fi
done

