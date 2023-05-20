#!/bin/bash

# Get current version from a file or environment variable
CURRENT_VERSION="1.2.3"

# Define function to increment the version
increment_version() {
  local version=$1
  local release_type=$2
  local major
  local minor
  local patch

  # Split the version into major, minor, and patch components
  IFS='.' read -r major minor patch <<< "$version"

  # Increment the appropriate version component based on the release type
  case $release_type in
    major)
      ((major++))
      minor=0
      patch=0
      ;;
    minor)
      ((minor++))
      patch=0
      ;;
    patch)
      ((patch++))
      ;;
    *)
      echo "Invalid release type. Please specify 'major', 'minor', or 'patch'."
      exit 1
      ;;
  esac

  # Construct the new version
  local new_version="$major.$minor.$patch"

  echo "$new_version"
}

# Parse the command-line argument for the release type
release_type=$1

# Call the increment_version function with the current version and release type
new_version=$(increment_version "$CURRENT_VERSION" "$release_type")

# Output the new version
echo "New version: $new_version"
