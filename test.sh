name: "Issue comment"

on:
  issues:
    types:
      - reopened
      - opened

jobs:
  comment-issues:
    env:
      TITLE: ${github.event.issue.title//\[\w+\]/}
      PREPARED_TITLE: ${TITLE// /}
      LENGTH_TITLE: ${#PREPARED_TITLE}
    uses: KristinaZoteva/counter-actions-test/.github/workflows/check_issues.yaml@main
    if: '(${LENGTH_TITLE} < 4) || (#github.event.issue.body < 10)'
    with:
      REPO_PATH: 'https://github.com/KristinaZoteva/counter-actions-test/issues/new'
      SECRET_ISSUES: ${{ secrets.SECRET_ISSUE }}