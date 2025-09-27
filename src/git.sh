#!/usr/bin/env bash

## git.sh

repo_pdf() {
  tmp=$(mktemp);
  tag=$(basename -s .txt $1)
  cat $1 | cut -f1 | sort> $tmp;
  sed -e ':a;N;$!ba;s/\n/<br>\n/g' $tmp > ${tag}.html;
  as_pdf ${tag}.html;
  rm $tmp;
}