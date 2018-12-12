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

(module+ test
  (require rackunit)
  ;; only use for internal tests, use check- functions 
  (check-true "dummy first test" #f))

(provide generate-json)

(define (sys cmd)
  (string-split (with-output-to-string (lambda () (system cmd))) "\n"))

(define (generate-json)
  (define short-sha (sys "git rev-parse --short HEAD"))
  (define raw-list (sys "ls -d retailers/*/*"))

  (define no-prefix (map (lambda (str)
                           (string-trim str #rx"retailers/" #:right? #f)) raw-list))
  (define changed-dirs (map (lambda (str)
                              (string-split str "/" #:repeat? #t)) no-prefix))
  (define remove-files (filter (lambda (str-list)
                                 (> (length str-list) 1)) changed-dirs))
  (define final-dirs (map (lambda (str-list)
                          (string-join (list (first str-list) (second str-list)) "/")) remove-files))
  ;; (printf "sha: ~a final-dirs: ~a" short-sha final-dirs)
  (define results (make-hash))

  (for ([dir final-dirs])
    ;;   Lookup short sha for retailers/dir
    (define sha (first (sys (format "git log -n 1 --pretty=format:'%h' retailers/~a" dir))))
    ;;   Assign dir and the short sha to results hash
    (hash-set! results (string->symbol dir) sha))

  ;; Convert results hash to json
  (displayln (jsexpr->string results))
  )
