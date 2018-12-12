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
(require json)
(require threading)

(module+ test
  (require rackunit)
  ;; only use for internal tests, use check- functions 
  (check-true "dummy first test" #f))

(provide generate-json)

(define (sys cmd)
  (string-split (with-output-to-string (lambda () (system cmd))) "\n"))

(define (generate-json)
  (define raw-list (sys "ls -d retailers/*/*"))
  (define results (make-hash))

  (for ([dir raw-list])
    (define split-dir (~> dir
        (string-trim #rx"retailers/" #:right? #f)
        (string-split "/" #:repeat? #t)))
    (cond
      [(> (length split-dir) 1) ;; Filter out any single level directories
        (let ([final-dir (string-join (list (first split-dir) (second split-dir)) "/")])
          (~> final-dir
            ;;   Lookup short sha for retailers/dir
            (format "git log -n 1 --pretty=format:'%h' retailers/~a" _)
            sys
            first
            ;;   Assign dir and the short sha to results hash
            (hash-set! results (string->symbol final-dir) _)))]))

  ;; Convert results hash to json
  (displayln (jsexpr->string results)))
