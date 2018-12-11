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
(require racket/string)
(require racket/list)

(module+ test
  (require rackunit)
  ;; only use for internal tests, use check- functions 
  (check-true "dummy first test" #f))

(provide generate-json
         git-diff
         sys)
(define (sys cmd)
  (string-split (with-output-to-string (lambda () (system cmd))) "\n"))

(define (git-diff)
  (sys "git diff --name-only HEAD~1..HEAD ."))

(define (generate-json)
  (define raw-list (git-diff))
  (define no-prefix (map (lambda (str)
                           (string-trim str #rx"retailers/" #:right? #f)) raw-list))
  (define changed-dirs (map (lambda (str)
                              (string-split str "/" #:repeat? #t)) no-prefix))
  (define final-dirs (map (lambda (str-list)
                          (string-join (list (first str-list) (second str-list)) "/")) changed-dirs))
  final-dirs
  )
