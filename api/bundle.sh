#!/bin/bash

# Get all YAML files in the resource directory
yaml_files=$(find ./resource -type f -name "*.yaml")

# Loop through each YAML file and execute the command
for file in $yaml_files; do
  # Extract the filename without the extension
  filename=$(basename "$file" .yaml)

  # Execute the command
  npx swagger-cli bundle "$file" -o "bundle-yaml/$filename.yaml" -t yaml
done

# Combine all the YAML files into a single file
npx swagger-combine swagger-config.json -o openapi.yaml -f yaml

# info
echo "OpenAPI file has been created"
