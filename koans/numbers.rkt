#lang racket/base

(require rackunit)

; Arithmetic uses functions. The resulting forms are in prefix notation.
(check-equal? (+ 1 0) 2)
(check-equal? (* 1 0) 1)
(check-equal? (/ 4 2) 1)
(check-equal? (- 1 1) 1)
(check-equal? (+ (+ 2 (* 3 3)) (+ 76 11)) 0)
