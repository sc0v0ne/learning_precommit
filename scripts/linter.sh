#!/bin/bash
./scripts/build.sh

docker run --rm project_linter:latest pre-commit run --all-files flake8
status=$?
if test $status -ne 0
then
    exit $status
fi

docker run --rm project_linter:latest pre-commit run --all-files hadolint
status=$?
if test $status -ne 0
then
    exit $status
fi

docker run --rm project_linter:latest pre-commit run --all-files shellcheck
status=$?
if test $status -ne 0
then
    exit $status
fi