#!/bin/bash
docker build . -f containers/Dockerfile -t project_linter:latest --rm