#!/bin/bash
# Script: fix_logo_deploy.sh
# Purpose: Organize assets, fix logo path, commit, and push to GitHub

# Step 1: Create assets folder
mkdir -p assets

# Step 2: Move logo file to assets (adjust if your logo filename is different)
if [ -f logo.jpg ]; then
    mv logo.jpg assets/logo.jpg
    echo "Moved logo.jpg to assets/logo.jpg"
else
    echo "logo.jpg not found in current directory! Please check filename."
fi

# Step 3: Update index.html to use correct path
if [ -f index.html ]; then
    sed -i 's|<img src="logo.jpg"|<img src="assets/logo.jpg"|g' index.html
    echo "Updated index.html logo path"
else
    echo "index.html not found!"
fi

# Step 4: Stage changes
git add .

# Step 5: Commit changes
git commit -m "Fix logo path and organize assets"

# Step 6: Push to GitHub
git push origin main

echo "✅ Done! Your logo path is fixed and pushed to GitHub."
