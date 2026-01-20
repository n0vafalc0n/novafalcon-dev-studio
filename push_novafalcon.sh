#!/bin/bash
# -----------------------------
# NovaFalcon Dev Studio Git Push Script
# -----------------------------

echo "Step 1: Generating SSH key (no passphrase)..."
ssh-keygen -t ed25519 -C "falconnova71@gmail.com" -f ~/.ssh/id_ed25519 -N ""

echo "Step 2: Starting ssh-agent and adding key..."
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

echo "Step 3: Your public key (copy all of this to GitHub SSH keys):"
cat ~/.ssh/id_ed25519.pub
echo ""
echo "--------------------------"
echo "Go to GitHub → Settings → SSH and GPG keys → New SSH key"
echo "Paste the key above and save it."
read -p "Press Enter after you have added the key to GitHub..."

echo "Step 4: Navigate to project folder"
cd ~/NOVAFALCON-DEV-STUDIO || { echo "Folder not found!"; exit 1; }

echo "Step 5: Remove old remote (if exists)"
git remote remove origin 2>/dev/null

echo "Step 6: Add GitHub SSH remote"
git remote add origin git@github.com:n0vafalc0n/novafalcon-dev-studio.git

echo "Step 7: Stage all files"
git add .

echo "Step 8: Commit changes"
git commit -m "Initial commit of NovaFalcon Dev Studio demo" 2>/dev/null || echo "Nothing to commit"

echo "Step 9: Push to GitHub"
git push -u origin main

echo "✅ All done! Your NovaFalcon demo is now on GitHub via SSH."
