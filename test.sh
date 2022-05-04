name: "Issue comment"

on:
  issues:
    types:
      - reopened
      - opened

env:
    TITLE: ${github.event.issue.title//\[\w+\]/}
    PREPARED_TITLE: ${TITLE// /}
    LENGTH_TITLE: ${#PREPARED_TITLE}

jobs:
  comment-issues:
    if: '(${LENGTH_TITLE} < 4) || (#github.event.issue.body < 10)'
    uses: KristinaZoteva/counter-actions-test/.github/workflows/check_issues.yaml@main
    with:
      REPO_PATH: 'https://github.com/KristinaZoteva/counter-actions-test/issues/new'
    secrets:
      SECRET_ISSUES: ${{ secrets.SECRET_ISSUE }}