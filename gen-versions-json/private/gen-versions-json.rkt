#lang racket/base
;;
;; gen-versions-json - gen-versions-json.
;;   Generate custom versions.json file, a map of top level directories to SHA prefix. Used for cache breaking
;;
;; Copyright (c) 2018 Robert J. Berger (rberger@ibd.com).

;; Racket Style Guide: http://docs.racket-lang.org/style/index.html

;; (require racket/contract)

;; (provide
;;  (contract-out))

;; ---------- Requirements

;; ---------- Internal types

;; ---------- Implementation

;; ---------- Internal procedures

;; ---------- Internal tests
(require racket/system)
(require racket/port)

(module+ test
  (require rackunit)
  ;; only use for internal tests, use check- functions 
  (check-true "dummy first test" #f))

(provide foo
         git-diff)
(define (foo  msg) (printf "HI ~a\n" msg))

(define (git-diff) (with-output-to-string (lambda () (system "git diff --name-only HEAD~1..HEAD ."))))
