#lang racket/base

(require rackunit)

; A "binding" is just an association between a name and a value.
(define foo "some value")

; One name can result in multiple possible values, so scoping
; rules are always in effect to pick the most relevant value.
(define (with-shadow)
  (define foo "This is my turf.")
  foo)

(check-equal?
  (with-shadow)
  "?"
  "One binding can shadow another")

; `define`'s rules might end up a little constraining.
(define (defined-function-defines-so-many-defines-with-define-make-it-stop)
  (define a 0) ; 1. all defines must appear at the start of a function definiton.
  (define b 1) ; 2. You must write a new (define) for every new binding.
  (define c 2)
  (define d 3)
  (+ a b c d))

; Enter `let`.
;
; 1. It can appear anywhere an expression can appear.
; 2. It has its own scope.
; 3. It can create more than one binding at a time.
;
; As always, the last expression in the body is the resulting value
; of the entire 'let' expression.
(check-equal?
  (let ([a 0] [b 1] [c 2] [d 3]) "?")
  (defined-function-defines-so-many-defines-with-define-make-it-stop))

; `let*` can have later bindings refer to earlier bindings. `let` can't do that.
(check-equal?
  (let ([a 1] [b 1])
      (+ a b))
  (let* ([a 1] [b (+ a 1)])
      "?"))
