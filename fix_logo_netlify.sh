#!/bin/bash
# fix_logo_netlify.sh
# Purpose: Auto-detect logo, move to assets/, fix HTML path, commit & push to GitHub

# Step 1: Create assets folder if it doesn't exist
mkdir -p assets

# Step 2: Detect logo file
logo_file=$(ls | grep -E 'logo\.(jpg|jpeg|png)' | head -n 1)

if [ -z "$logo_file" ]; then
    echo "❌ No logo file found (logo.jpg, logo.jpeg, or logo.png). Please place it in the folder."
    exit 1
fi

# Step 3: Move logo to assets
mv "$logo_file" assets/
echo "✅ Moved $logo_file to assets/$logo_file"

# Step 4: Update index.html path
if [ -f index.html ]; then
    sed -i "s|<img src=[\"'].*logo\.(jpg|jpeg|png)[\"']|<img src=\"assets/$logo_file\"|g" index.html
    echo "✅ Updated index.html logo path to assets/$logo_file"
else
    echo "❌ index.html not found!"
    exit 1
fi

# Step 5: Stage changes
git add .

# Step 6: Commit
git commit -m "Fix logo path for Netlify deployment" || echo "No changes to commit"

# Step 7: Push to GitHub
git push origin main

echo "🎉 Done! Logo path fixed and pushed. Check your Netlify site."
