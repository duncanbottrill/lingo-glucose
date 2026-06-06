#!/bin/bash
# Finds the latest Lingo CSV in Downloads and pushes it to GitHub

LATEST=$(ls -t ~/Downloads/lingo-glucose-data-*.csv 2>/dev/null | head -1)

if [ -z "$LATEST" ]; then
  echo "❌ No Lingo CSV found in Downloads folder."
  read -p "Press Enter to close..."
  exit 1
fi

echo "✅ Found: $LATEST"
cp "$LATEST" ~/lingo-glucose-app/data/glucose.csv

cd ~/lingo-glucose-app
git add data/glucose.csv
git commit -m "Update glucose data $(date '+%Y-%m-%d')"
git push

echo ""
echo "🎉 Done! Your dashboard is updated."
read -p "Press Enter to close..."
