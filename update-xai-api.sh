#!/bin/bash
# Pipeline to refresh xai-api.md from official xAI docs
# Usage: ./update-xai-api.sh

set -e

OUTFILE="xai-api.md"
TMPFILE="/tmp/xai-api-raw.html"

echo "Fetching latest xAI API docs..."
curl -sL https://docs.x.ai/ -o "$TMPFILE"

# Extract main content (rough parse — adjust selector if site changes)
# For now, just note that full extraction needs a proper scraper.
# This script is a placeholder that reminds you to re-run web search.

echo "Note: docs.x.ai is HTML; no official xai-api.md to fetch directly."
echo "To update: run a web search for 'xai api documentation' and paste into $OUTFILE."
echo "Done. (Manual refresh recommended when xAI docs change.)"
rm -f "$TMPFILE"
