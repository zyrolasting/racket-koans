#lang racket/base

(require rackunit)


; Functions are just values. You can pass them around.
(define (apply-op f a b) (f a b))
(check-equal? (apply-op * 3 3) "?")
(check-equal? (apply-op + 3 3) "?")
(check-equal? (apply-op - 3 3) "?")

; Not all functions need a name. `lambda` returns a new anonymous function.
(check-equal?
  (apply-op
    (lambda (a b) (+ (* a a) (* b b)))
    3 4)
  "?")

; Functions can return other functions. Notice the 'enclosed' binding.
(define (make-fn enclosed) (lambda () enclosed))

; Let's make a couple of functions that return fixed values.
(define returns-string (make-fn "Hey handsome."))
(define returns-number (make-fn 3.14))

; Created functions remember the bindings leading up to them.
(check-equal? (returns-string) "?")
(check-equal? (returns-number) "?")
