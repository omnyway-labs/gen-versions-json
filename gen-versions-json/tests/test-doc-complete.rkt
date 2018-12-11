#lang racket/base
;;
;; gen-versions-json - Test Documentation Coverage.
;;
;; Copyright (c) 2018 Robert J. Berger (rberger@ibd.com).

(require racket/contract)

(provide

 (contract-out

  [test-doc-coverage
   (-> (listof string?) any)]))

;; ---------- Requirements

(require racket/string
         rackunit
         rackunit/docs-complete)

;; ---------- Test Utilities

(define (test-doc-coverage module-list)
  (for ([module module-list])
    (test-case
     (format "test for documentation in ~a" module)
     (let ([s (open-output-string)])
       (parameterize ([current-error-port s])
         (check-docs module))
       (define out (get-output-string s))
       (when (non-empty-string? out)
         (displayln out))
       (check-eq? (string-length out) 0)))))

(test-doc-coverage '(gen-versions-json))
