#lang racket/base

(require rackunit)

; If X = 2 in X + X, then you find 4 by substitution.
;
;   X + X
; = 2 + X
; = 2 + 2
; = 4
;
; Racket computes values similarly. The order of evaluation matters,
; or else you wouldn't know if `4 + 4 * 8` is 36 or 64. Racket deals
; with more than just numbers though, so it uses substitution rules to
; structure an order of operations for values in general.


; `define` is a flexible and clear way to bind an identifier to a value.
; Replace '? with your answer.
(define number 2)
(check-equal? '? (+ number number))


; Identifiers can be reused to bind many different values, so how do
; you know what value to use when you see an identifier? This use of
; `define` creates a function that also uses `foo`, for example.
;
; The function has its own scope for bindings, which shadows existing
; scopes.

(define (with-shadow)
  (define number "This is my turf.")
  number)

(check-equal? (with-shadow) "?" "One binding can shadow another")
(check-equal? foo "?" "Shadowing is not the same as overwriting.")


; We've needed one `define` for every new binding, but there are other
; ways to bind values.
(define (defined-function-defines-so-many-defines-with-define-make-it-stop)
  (define a 0)
  (define b 1)
  (define c 2)
  (define d 3)
  (+ a b c d))


; `define-values` binds multiple identifiers in one expression, for example.
(define (easier-to-read)
  (define-values (a b c d) (values 0 1 2 3))
  (+ a b c d))


; `let` binds values within a single expression.
;
; The last expression in the body is the resulting value of the
; entire 'let' expression.
(check-equal?
  (let ([a 0] [b 1] [c 2] [d 3]) "?")
  (defined-function-defines-so-many-defines-with-define-make-it-stop))

(check-equal?
  (let ([a 1] [b 1])
      (+ a b)) ; In `let*`, you can refer to earlier bindings.
  (let* ([a 1] [b (+ a 1)])
      "?"))
