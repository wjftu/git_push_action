#!/bin/sh

set -e

echo "git version: $(git --version)"



if [[ -z "${TARGET_REPO}"]]; then
    PUSH_REPO="${GITHUB_REPOSITORY}"
else
    PUSH_REPO="TARGET_REPO"
fi

if [[ -z "${TARGET_BRANCH}"]]
    PUSH_BRANCH="master"
else
    PUSH_BRANCH=${TARGET_BRANCH}
fi

PUSH_URL="https://username:${ACCESS_TOKEN}@github.com/${PUSH_REPO}.git"

echo "target repo: ${PUSH_REPO}"
echo "target branch: ${PUSH_BRANCH}"

cd ${SOURCE_DIR}

git init
git config user.name "${GITHUB_ACTOR}"
git config user.email "${GITHUB_ACTOR}@users.noreply.github.com"


if [[ -z "$COMMIT_MESSAGE" ]]; then
  COMMIT_MESSAGE="Automated deployment @ $(date '+%Y-%m-%d %H:%M:%S')" 
fi

git commit -m "${COMMIT_MESSAGE}"


echo "start push in `pwd`"

git push --force ${PUSH_URL} master:${PUSH_BRANCH}
rm -fr .git

echo "Push success!"