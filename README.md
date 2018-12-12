# Racket package gen-versions-json

[![GitHub release](https://img.shields.io/github/release/omnyway-labs/gen-versions-json.svg?style=flat-square)](https://github.com/omnyway-labs/gen-versions-json/releases)
[![Travis Status](https://travis-ci.org/omnyway-labs/gen-versions-json.svg)](https://www.travis-ci.org/omnyway-labs/gen-versions-json)
[![Coverage Status](https://coveralls.io/repos/github/omnyway-labs/gen-versions-json/badge.svg?branch=master)](https://coveralls.io/github/omnyway-labs/gen-versions-json?branch=master)
[![raco pkg install gen-versions-json](https://img.shields.io/badge/raco%20pkg%20install-rml--core-blue.svg)](http://pkgs.racket-lang.org/package/gen-versions-json)
[![Documentation](https://img.shields.io/badge/raco%20docs-rml--core-blue.svg)](http://docs.racket-lang.org/gen-versions-json/index.html)
[![GitHub stars](https://img.shields.io/github/stars/omnyway-labs/gen-versions-json.svg)](https://github.com/omnyway-labs/gen-versions-json/stargazers)
![MIT License](https://img.shields.io/badge/license-MIT-118811.svg)



## Modules

* `gen-versions-json` 

Not much to do with the module. Its mainly used by the CLI to run as a program.

## Example

Only useful to run in the top level of the `omnypay/haiwai-retailers-assets` repo. 

Will output a json blob that can be saved to a file.
```
cd <path-to-working-dir>/haiwai-retailers/assets
gen-versions.json > versions.json
```


## Installation

* Change to the `gen-versions-dir` subdirectory of this repo
* Install dependency: `raco  pkg install threading`
* To install (from within the package directory): `raco pkg install`
* To uninstall: `raco pkg remove gen-versions-json`
* To view documentation: `raco docs gen-versions-json`

## Distribution

* To build for private distribution: `make dist`

## History

* **1.0.0** - Initial Version

[![Racket Language](https://raw.githubusercontent.com/johnstonskj/racket-scaffold/master/scaffold/plank-files/racket-lang.png)](https://racket-lang.org/)
