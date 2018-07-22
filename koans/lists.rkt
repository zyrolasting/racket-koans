#lang racket/base

(require rackunit)

; https://docs.racket-lang.org/guide/pairs.html?q=pairs


; Make a pair matching expectations.
(define pair "?")
(check-pred pair? pair)
(check-equal? (car pair) "first")
(check-equal? (car (cdr pair)) "second")

; Make a list of the first 1000 positive integers. Do not type it longhand.
(define thousand "?")

(define (counter-matches-element lst i)
  (if (null? lst)
    i
    (if (eqv? i (car lst))
      (counter-matches-element (cdr lst) (add1 i))
      i)))

(check-eqv?
  (counter-matches-element thousand 1)
  1001)
