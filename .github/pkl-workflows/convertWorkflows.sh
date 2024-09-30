#!/bin/bash

for file in *.pkl; do
	pkl eval "$file" -o "../workflows/$(basename "${file/.pkl/.generated.yml}")"
done