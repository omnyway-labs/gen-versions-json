#lang scribble/manual

@(require racket/file scribble/core)

@;{============================================================================}

@title[#:version "1.0"]{Package gen-versions-json.}
@author[(author+email "Robert J. Berger" "rberger@ibd.com")]

Generate custom versions.json file, a map of top level directories to SHA prefix. Used for cache breaking

@table-of-contents[]

@include-section["_gen-versions-json.scrbl"]

@section{License}

@verbatim|{|@file->string["../LICENSE"]}|