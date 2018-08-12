#lang racket/base

(require
  rackunit
  syntax/macro-testing)


;;; All .rkt files you have seen are modules and the instructions within
;;; them make up the modules' bodies. Even so, modules have their own forms
;;; that you can write explicitly.
;;;
;;; https://docs.racket-lang.org/guide/Module_Syntax.html


(module meta racket (define (submod-fn) "?"))
(require 'meta)

(check-not-exn (lambda ()
  (convert-compile-time-error
    (check-equal?
      (submod-fn)
      "From the submodule")))
  "Did you provide the submodule function?")
