#!/bin/bash

echo "Enter a number:"
read num

# Numbers less than 2 are not prime
if [ "$num" -lt 2 ]; then
  echo "$num is not a prime number."
  exit 0
fi

is_prime=true

# Check for divisibility from 2 up to the square root of the number
# For simplicity, this script checks up to num/2
for (( i=2; i*i <= num; i++ )); do
  if (( num % i == 0 )); then
    is_prime=false
    break
  fi
done

if "$is_prime"; then
  echo "$num is a prime number."
else
  echo "$num is not a prime number."
fi