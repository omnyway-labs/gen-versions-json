#lang info
;;
;; Collection gen-versions-json / gen-versions-json.
;;   Generate custom versions.json file, a map of top level directories to SHA prefix. Used for cache breaking
;;
;; Copyright (c) 2018 Robert J. Berger (rberger@ibd.com).

(define collection "gen-versions-json")
(define scribblings '(("scribblings/gen-versions-json.scrbl" (multi-page))))

(define test-omit-paths '("scribblings" "private"))
