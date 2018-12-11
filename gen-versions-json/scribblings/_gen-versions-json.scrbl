#lang scribble/manual

@(require racket/sandbox
          scribble/core
          scribble/eval
          gen-versions-json
          (for-label racket/base
                     racket/contract
                     gen-versions-json))

@;{============================================================================}

@(define example-eval (make-base-eval
                      '(require racket/string
                                gen-versions-json)))

@;{============================================================================}

@title[]{Module gen-versions-json.}
@defmodule[gen-versions-json]

Generate custom versions.json file, a map of top level directories to SHA prefix. Used for cache breaking

@examples[ #:eval example-eval
(require gen-versions-json)
; add more here.
]

@;{============================================================================}

@;Add your API documentation here...


Document  - TBD
