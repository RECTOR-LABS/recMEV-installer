#!/bin/bash

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_step() {
    echo -e "${GREEN}[STEP]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to confirm action
confirm_action() {
    read -p "$1 (y/n): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        print_error "Action cancelled by user"
        exit 1
    fi
}

# Function to determine version from binary files
determine_version() {
    # Look for mac binary to determine version
    local mac_binary=$(ls recmev-v*-mac 2>/dev/null | head -n 1)
    if [ -z "$mac_binary" ]; then
        print_error "No Mac binary found. Cannot determine version."
        exit 1
    fi
    
    # Extract version from binary name (e.g., recmev-v0.5.5-mac -> 0.5.5)
    VERSION=$(echo $mac_binary | grep -o 'v[0-9]\+\.[0-9]\+\.[0-9]\+' | sed 's/v//')
    if [ -z "$VERSION" ]; then
        print_error "Could not determine version from binary name"
        exit 1
    fi
    
    echo $VERSION
}

# Function to validate binaries
validate_binaries() {
    local version=$1
    local linux_binary="recmev-v${version}-linux"
    local mac_binary="recmev-v${version}-mac"
    
    if [ ! -f "$linux_binary" ] || [ ! -f "$mac_binary" ]; then
        print_error "Missing required binaries for version v${version}"
        print_error "Expected files:"
        print_error "- ${linux_binary}"
        print_error "- ${mac_binary}"
        exit 1
    fi
}

# Main release process
main() {
    print_step "Starting release process..."
    
    # Step 1: Determine version
    VERSION=$(determine_version)
    print_step "Detected version: v${VERSION}"
    confirm_action "Is this the correct version?"
    
    # Step 2: Clean up old binaries
    print_step "Cleaning up old binaries..."
    confirm_action "This will remove ALL previous version binaries. Continue?"
    
    # Store new version binaries temporarily
    mkdir -p temp_binaries
    mv "recmev-v${VERSION}-linux" "recmev-v${VERSION}-mac" temp_binaries/
    rm -f recmev-v*-linux recmev-v*-mac
    mv temp_binaries/* .
    rmdir temp_binaries
    
    print_step "Verifying binaries..."
    validate_binaries "$VERSION"
    
    # Step 3: Update documentation
    print_step "Updating version.txt..."
    echo "$VERSION" > version.txt
    
    print_step "Please manually review and update the following files:"
    echo "1. README.md - Update version references"
    echo "2. install.sh - Update version numbers"
    echo "3. CHANGELOG.md - Ensure release notes are updated"
    confirm_action "Have you updated these files?"
    
    # Step 4: Git operations
    print_step "Preparing git commit and tag..."
    git add .
    git status
    confirm_action "Review the changes above. Proceed with commit?"
    
    git commit -m "Release v${VERSION}"
    git tag "v${VERSION}"
    
    print_step "Pushing changes..."
    confirm_action "Ready to push changes and tags to remote?"
    git push
    git push --tags
    
    # Step 5: Create GitHub Release
    print_step "Creating GitHub Release..."
    print_warning "Make sure you have the GitHub CLI (gh) installed and authenticated"
    confirm_action "Ready to create GitHub release?"
    
    gh release create "v${VERSION}" \
        "recmev-v${VERSION}-mac" \
        "recmev-v${VERSION}-linux" \
        --title "Release v${VERSION}" \
        --notes-file CHANGELOG.md
    
    print_step "Release process completed successfully!"
    echo "Please verify the following:"
    echo "1. GitHub release is created correctly"
    echo "2. Both binaries are attached to the release"
    echo "3. Release notes are properly formatted"
    echo "4. All documentation is up to date"
}

# Run the script
main 