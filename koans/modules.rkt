#lang racket/base

(require rackunit)


;;; All .rkt files you have seen are modules and the instructions within
;;; them make up the modules' bodies. Even so, modules have their own forms
;;; that you can write explicitly.
;;;
;;; https://docs.racket-lang.org/guide/Module_Syntax.html


(module "?" "?" "?")
(require 'meta)
(check-equal?
  (submod-fn)
  "From the submodule")
