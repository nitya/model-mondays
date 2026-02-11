#!/bin/bash
# Model Mondays Repository Validation Script
# This script validates the repository structure, files, and links

set -e

REPO_ROOT="/workspaces/model-mondays"
ERRORS=0
WARNINGS=0

echo "🔍 Model Mondays Repository Validation"
echo "======================================="
echo ""

# Color codes
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

error() {
    echo -e "${RED}❌ ERROR: $1${NC}"
    ((ERRORS++))
}

warning() {
    echo -e "${YELLOW}⚠️  WARNING: $1${NC}"
    ((WARNINGS++))
}

success() {
    echo -e "${GREEN}✅ $1${NC}"
}

info() {
    echo "ℹ️  $1"
}

# Check 1: Verify directory structure
echo "📁 Checking directory structure..."
required_dirs=(
    "data"
    "docs/model-mondays"
    "docs/foundry-fridays"
    "docs/customer-stories"
    "docs/assets/model-mondays"
    "docs/assets/foundry-fridays"
    "docs/assets/customer-stories"
    "docs/assets/people"
    "docs/assets/misc"
)

for dir in "${required_dirs[@]}"; do
    if [ -d "$REPO_ROOT/$dir" ]; then
        success "Directory exists: $dir"
    else
        error "Missing directory: $dir"
    fi
done
echo ""

# Check 2: Validate file naming conventions
echo "📝 Checking file naming conventions..."
INVALID_NAMES=0

# Check episode files
while IFS= read -r file; do
    basename=$(basename "$file")
    if [[ ! $basename =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}-s[0-9]{2}-e[0-9]{2}\.md$ ]]; then
        if [[ $basename != "README.md" ]]; then
            error "Invalid filename: $basename"
            ((INVALID_NAMES++))
        fi
    fi
done < <(find "$REPO_ROOT/docs/model-mondays" -name "*.md" 2>/dev/null)

# Check AMA files
while IFS= read -r file; do
    basename=$(basename "$file")
    if [[ ! $basename =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}-s[0-9]{2}-e[0-9]{2}\.md$ ]]; then
        if [[ $basename != "README.md" ]]; then
            error "Invalid filename: $basename"
            ((INVALID_NAMES++))
        fi
    fi
done < <(find "$REPO_ROOT/docs/foundry-fridays" -name "*.md" 2>/dev/null)

if [ $INVALID_NAMES -eq 0 ]; then
    success "All files follow naming convention"
fi
echo ""

# Check 3: Verify banner images exist for all episodes
echo "🖼️  Checking banner images..."
MISSING_BANNERS=0

# Check episode banners
while IFS= read -r file; do
    basename=$(basename "$file" .md)
    if [[ $basename != "README" ]]; then
        # Extract season and episode
        if [[ $basename =~ s([0-9]{2})-e([0-9]{2}) ]]; then
            season=${BASH_REMATCH[1]}
            episode=${BASH_REMATCH[2]}
            # Remove leading zeros for banner filename
            season=$((10#$season))
            episode=$((10#$episode))
            banner="$REPO_ROOT/docs/assets/model-mondays/S${season}-E${episode}.png"
            if [ ! -f "$banner" ]; then
                warning "Missing episode banner: S${season}-E${episode}.png"
                ((MISSING_BANNERS++))
            fi
        fi
    fi
done < <(find "$REPO_ROOT/docs/model-mondays" -name "*.md" 2>/dev/null)

# Check AMA banners
while IFS= read -r file; do
    basename=$(basename "$file" .md)
    if [[ $basename != "README" ]]; then
        # Extract season and episode
        if [[ $basename =~ s([0-9]{2})-e([0-9]{2}) ]]; then
            season=${BASH_REMATCH[1]}
            episode=${BASH_REMATCH[2]}
            # Remove leading zeros for banner filename
            season=$((10#$season))
            episode=$((10#$episode))
            banner="$REPO_ROOT/docs/assets/foundry-fridays/S${season}-E${episode}-AMA.png"
            if [ ! -f "$banner" ]; then
                warning "Missing AMA banner: S${season}-E${episode}-AMA.png"
                ((MISSING_BANNERS++))
            fi
        fi
    fi
done < <(find "$REPO_ROOT/docs/foundry-fridays" -name "*.md" 2>/dev/null)

# Check customer story banners (referenced in customer-stories/README.md)
# These follow the same SX-EY.png format
# Note: Not all episodes have customer stories, so we only check what's referenced
while IFS= read -r line; do
    if [[ $line =~ \!\[.*\]\(\.\./assets/customer-stories/(S[0-9]+-E[0-9]+\.png)\) ]]; then
        banner_name="${BASH_REMATCH[1]}"
        banner="$REPO_ROOT/docs/assets/customer-stories/$banner_name"
        if [ ! -f "$banner" ]; then
            warning "Missing customer story banner: $banner_name"
            ((MISSING_BANNERS++))
        fi
    fi
done < <(cat "$REPO_ROOT/docs/customer-stories/README.md" 2>/dev/null)

if [ $MISSING_BANNERS -eq 0 ]; then
    success "All banner images exist"
fi
echo ""

# Check 4: Validate image references in markdown files
echo "🔗 Checking image references..."
BROKEN_REFS=0

while IFS= read -r file; do
    while IFS= read -r line; do
        if [[ $line =~ \!\[.*\]\((.*\.png)\) ]]; then
            img_path="${BASH_REMATCH[1]}"
            # Skip if absolute URL
            if [[ $img_path =~ ^https?:// ]]; then
                continue
            fi
            # Resolve relative path
            dir=$(dirname "$file")
            full_path=$(cd "$dir" && realpath -m "$img_path" 2>/dev/null || echo "")
            if [ -z "$full_path" ] || [ ! -f "$full_path" ]; then
                error "Broken image reference in $(basename $file): $img_path"
                ((BROKEN_REFS++))
            fi
        fi
    done < "$file"
done < <(find "$REPO_ROOT/docs" -name "*.md" -type f 2>/dev/null)

if [ $BROKEN_REFS -eq 0 ]; then
    success "All image references are valid"
fi
echo ""

# Check 5: Validate JSON files
echo "📋 Validating JSON metadata..."
JSON_ERRORS=0

for json_file in "$REPO_ROOT/data"/*.json; do
    if [ -f "$json_file" ]; then
        if python3 -m json.tool "$json_file" > /dev/null 2>&1; then
            success "Valid JSON: $(basename $json_file)"
        else
            error "Invalid JSON: $(basename $json_file)"
            ((JSON_ERRORS++))
        fi
    fi
done

if [ $JSON_ERRORS -gt 0 ]; then
    error "Found $JSON_ERRORS invalid JSON files"
fi
echo ""

# Check 6: Count files
echo "📊 Repository Statistics"
echo "------------------------"
EPISODE_COUNT=$(find "$REPO_ROOT/docs/model-mondays" -name "*.md" ! -name "README.md" 2>/dev/null | wc -l)
AMA_COUNT=$(find "$REPO_ROOT/docs/foundry-fridays" -name "*.md" ! -name "README.md" 2>/dev/null | wc -l)
EPISODE_BANNERS=$(find "$REPO_ROOT/docs/assets/model-mondays" -name "S*-E*.png" 2>/dev/null | wc -l)
AMA_BANNERS=$(find "$REPO_ROOT/docs/assets/foundry-fridays" -name "S*-E*-AMA.png" 2>/dev/null | wc -l)

info "Episodes: $EPISODE_COUNT"
info "AMAs: $AMA_COUNT"
info "Episode Banners: $EPISODE_BANNERS"
info "AMA Banners: $AMA_BANNERS"
echo ""

# Summary
echo "======================================="
echo "📊 Validation Summary"
echo "======================================="
if [ $ERRORS -eq 0 ] && [ $WARNINGS -eq 0 ]; then
    success "Repository is valid! No issues found."
    exit 0
elif [ $ERRORS -eq 0 ]; then
    echo -e "${YELLOW}⚠️  Found $WARNINGS warnings${NC}"
    exit 0
else
    echo -e "${RED}❌ Found $ERRORS errors and $WARNINGS warnings${NC}"
    exit 1
fi
