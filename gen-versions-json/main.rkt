#lang racket/base
;;
;; gen-versions-json - gen-versions-json.
;;   Generate custom versions.json file, a map of top level directories to SHA
;;   prefix. Used for cache breaking

;;
;; Copyright (c) 2018 Robert J. Berger (rberger@ibd.com).

;; Racket Style Guide: http://docs.racket-lang.org/style/index.html

(require racket/contract)

(provide
 (contract-out))

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
     #:program "compiler"
     #:once-each
     [("-v" "--verbose") "Compile with verbose messages"
                         (verbose-mode #t)]
     [("-p" "--profile") "Compile with profiling"
                         (profiling-on #t)]
     #:once-any
     [("-o" "--optimize-1") "Compile with optimization level 1"
                            (optimize-level 1)]
     ["--optimize-2"        (; show help on separate lines
                             "Compile with optimization level 2,"
                             "which includes all of level 1")
                            (optimize-level 2)]
     #:multi
     [("-l" "--link-flags") lf ; flag takes one argument
                            "Add a flag <lf> for the linker"
                            (link-flags (cons lf (link-flags)))]
     #:args (filename) ; expect one command-line argument: <filename>
     ; return the argument as a filename to compile
     filename))

    (printf "verbose: ~a\n" (verbose-mode))
    (printf "profiling-on: ~a\n" (profiling-on))
    (printf "optimize-level: ~a\n" (optimize-level))
    (printf "link-flags: ~a\n" (link-flags))
    (printf "filename: ~a\n" file-to-compile))
