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

; You need one `define` for every new binding. This can get old.
(define (defined-function-defines-so-many-defines-with-define-make-it-stop)
  (define a 0)
  (define b 1)
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
