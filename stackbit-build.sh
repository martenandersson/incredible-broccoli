#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e7c708f7cc1ac00148b8c67/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e7c708f7cc1ac00148b8c67
curl -s -X POST https://api.stackbit.com/project/5e7c708f7cc1ac00148b8c67/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5e7c708f7cc1ac00148b8c67/webhook/build/publish > /dev/null
