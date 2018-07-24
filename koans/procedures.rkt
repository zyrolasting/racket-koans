#lang racket/base

(require rackunit)


; Procedures (functions) are just values. You can pass them around.
(define (apply-op f a b) (f a b))
(check-equal? (apply-op * 3 3) "?")
(check-equal? (apply-op + 3 3) "?")
(check-equal? (apply-op - 3 3) "?")

; Not all procedures need a name. `lambda` returns a new anonymous procedure.
(check-equal?
  (apply-op
    (lambda (a b) (+ (* a a) (* b b)))
    3 4)
  "?")

; Procedures can return other procedures. Notice the 'enclosed' binding.
(define (make-fn enclosed) (lambda () enclosed))

; Let's make a couple of procedures that return fixed values.
(define returns-string (make-fn "Hey handsome."))
(define returns-number (make-fn 3.14))

; Created procedures remember the bindings leading up to them.
(check-equal? (returns-string) "?")
(check-equal? (returns-number) "?")
