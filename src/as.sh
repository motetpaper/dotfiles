#!/usr/bin/env bash

## as.sh
## conversion command line functions
## requires pandoc

as_pdf() {

  f=$(basename $1)
  if test -f $f; then
    b=${f%%.*}
    pandoc --pdf-engine weasyprint -t html --metadata title="$f" -o $b.pdf $f
  fi
}


as_epub() {

  f=$(basename $1)
  if test -f $f; then
    b=${f%%.*}
    pandoc -t html --metadata title="$f" -o $b.epub $f
  fi
}
