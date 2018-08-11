#lang racket

(require rackunit)


;; Procedures (functions) are just values. You can pass them around.
(define (apply-op f a b) (f a b))
(check-equal? (apply-op * 3 3) "?")
(check-equal? (apply-op + 3 3) "?")
(check-equal? (apply-op - 3 3) "?")

;; Not all procedures need a name. `lambda` returns a new anonymous procedure.
(check-equal?
  (apply-op
    (lambda (a b) (+ (* a a) (* b b)))
    3 4)
  "?")

;; Procedures can return other procedures. Notice the 'enclosed' binding.
(define (make-fn enclosed) (lambda () enclosed))

;; Let's make a couple of procedures that return fixed values.
(define returns-string (make-fn "Hey handsome."))
(define returns-number (make-fn 3.14))

;; Created procedures remember the bindings leading up to them.
(check-equal? (returns-string) "?")
(check-equal? (returns-number) "?")

;; Create a procedure that returns a new square of an integer
;; i each time it is called, starting from i = 0.
(define (next-square) "?")

(define (check-square n)
  (let ([expected (* n n)] [actual (next-square)])
    (if (eqv? expected actual)
      (if (< n 100)
        (check-square (add1 n))
        (void))
      (fail (format "next-square did not return the expected square of ~a" n)))))
(check-square 0)


;; Write a version of the ceiling function called `my-ceil` with a contract
;; that allows all inexact numbers except those that have no exact
;; representation, and that will always return an exact number.
(define (my-ceil n) "?")

;; The below instrumentation checks your work.
(define (my-ceil-valid? n)
  (with-handlers ([exn:fail:contract? (lambda (exn) #f)])
    (eqv? (my-ceil n) (exact-ceiling n))))

(define (and-p pred lst)
  (if (null? lst)
    #t
    (and
      (pred (first lst))
      (and-p pred (rest lst)))))

(check-true
  (and-p
    (lambda (n) (not (my-ceil-valid? n)))
    '(+inf.f -inf.f -inf.0 +inf.0 +nan.f -nan.f -nan.0 +nan.0)))

(check-true
  (and-p my-ceil-valid? '(-0.1 0.0 0.1 -2/314 9/781 4.1e3)))

;; Read this carefully: Write a procedure `my-join` that joins at least
;; one integer together into a single string with an optional delimiter
;; character that defaults to a single blank space as the first argument.
;; Have a contract enforce these precise restrictions. Hint: You will
;; need 'case->'
(define (my-join) "?")

;; Keep these checks as is.
(check-equal? (my-join #\- 1 2 3) "1-2-3")
(check-equal? (my-join #\space 1 2 3) "1 2 3")
(check-equal? (my-join 1 2 3) "1 2 3")
(check-equal? (my-join #\space 1) "1")
(check-equal? (my-join 1) "1")
(check-exn (λ () (my-join ",")))
(check-exn (λ () (my-join #\space "a" "b")))
(check-exn (λ () (my-join "," 0.1 9)))
