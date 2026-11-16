
#!/bin/bash
set -euo pipefail

echo "=== Generate Podcast Feed ==="

cd "$GITHUB_WORKSPACE"

git config --global user.name "${INPUT_NAME:-$GITHUB_ACTOR}"
git config --global user.email "${INPUT_EMAIL:?Email is required}"

git config --global --add safe.directory "$GITHUB_WORKSPACE"

python /usr/local/bin/feed.py

git add podcast.xml

if ! git diff --cached --quiet; then
    git commit -m "Update Podcast Feed"
    git push origin HEAD:main
else
    echo "No changes to commit"
fi

echo "=== Completed ==="
