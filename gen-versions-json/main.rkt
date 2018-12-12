#lang racket/base
;;
;; gen-versions-json - gen-versions-json.
;;   Generate custom versions.json file, a map of top level directories to SHA
;;   prefix. Used for cache breaking

#|
git diff --name-only HEAD~1..HEAD .
If a specified directory has changed files under it
  Map the directory sha to the current Repo SHA 
|#
;;
;; Copyright (c) 2018 Robert J. Berger (rberger@ibd.com).

;; Racket Style Guide: http://docs.racket-lang.org/style/index.html

;; (require racket/contract)

;; (provide
;;  (contract-out))

;; ---------- Requirements

(require "private/gen-versions-json.rkt")
(require racket/cmdline)

;; ---------- Internal types

;; ---------- Implementation

;; ---------- Internal procedures

;; ---------- Internal tests


(module+ test
  (require rackunit)
  ;; only use for internal tests, use check- functions 
  (check-true "dummy first test" #f))


(module+ main
  ;; Main entry point, executed when run with the `racket` executable or DrRacket.
  (define verbose-mode (make-parameter #f))
  (define profiling-on (make-parameter #f))
  (define optimize-level (make-parameter 0))
  (define link-flags (make-parameter null))

  (define file-to-compile
    (command-line
     #:program "gen-versions-json"
     #:once-each
     [("-v" "--verbose") "Compile with verbose messages"
                         (verbose-mode #t)]
     ))

    (generate-json))
