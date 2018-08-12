#lang racket/base

(require rackunit)

;;; https://docs.racket-lang.org/guide/pairs.html?q=pairs


;; Make a pair matching expectations.
(define pair "?")
(if (pair? pair)
  (begin
    (check-equal? (car pair) "first")
    (check-equal? (car (cdr pair)) "second"))
  (fail "Define a pair"))

;; Make a list of the first 1000 positive integers. Do not type it longhand.
(define thousand "?")

(define (counter-matches-element lst i)
  (if (null? lst)
    i
    (if (eqv? i (car lst))
      (counter-matches-element (cdr lst) (add1 i))
      i)))

(if (list? thousand)
  (check-eqv?
    (counter-matches-element thousand 1)
    1001)
  (fail "Define `thousand` as a list"))

;; Transform `thousand` into 'only-punc', which is a list of
;; characters such that every element matches char-punctuation?
(define only-punc "?")
(if (list? thousand)
  (check-true
    (and
      (foldl (lambda (e r) (and e r)) #t
        (map char-punctuation? only-punc))
      (eqv? (length only-punc) 32)))
  (fail "Define `only-punc` as a list"))
