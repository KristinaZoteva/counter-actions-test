#!/bin/bash

name: "Issue comment"

on:
  issues:
    types:
      - reopened
      - opened

jobs:
  comment_issues:
    runs-on: ubuntu-latest
    steps:
      - name: Definition of variables
        env:
         TITLE: ${github.event.issue.title//\[\w+\]/}
         PREPARED_TITLE: ${TITLE// /}
         LENGTH_TITLE: ${#PREPARED_TITLE}

      - name: Comment issue
        if: '(${LENGTH_TITLE} < 4) || (#github.event.issue.body < 10)'
        uses: KristinaZoteva/counter-actions-test/.github/workflows/check_issues.yaml@main
        with:
         REPO_PATH: 'https://github.com/KristinaZoteva/counter-actions-test/issues/new'
        secrets:
          SECRET_ISSUES: ${{ secrets.SECRET_ISSUE }}