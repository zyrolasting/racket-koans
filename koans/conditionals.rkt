#lang racket/base

(require rackunit)


; `if` evaluates exactly two expressions, in order: The test expression,
; and a matching expression. The matching expression is then returned.
(define counter 0)
(check-equal?
  (if #t "yay" (set! counter 1))
  "?")

; Given how 'if' is evaluated, does anything happen to 'counter'?
; Reflect on how using `if` differs from calling a function.
(check-equal? counter "?")

; Logical operators condense related tests and support short circuiting.
; If you've seen things like `(a && b)` or `(a || b)`, then that's what
; you are dealing with here.
;
;   (and) returns #t if all following tests are #t. It stops at the first #f.
;   (or) returns #t if at least one following test is #t. It stops at the first #t.
(check-equal? (and #t #t) "?")
(check-equal? (or #f #t) "?")
(check-equal? (and #f #t #t) "?")
(check-equal? (or #f #f) "?")

; Don't forget that conditionals return values. There may be gotchas.
(check-equal? (or (and #f #t) (and #t (or "nah" #f))) "?")

; You may negate results with `not`.
(check-equal? (not #f) "?")
(check-equal? (not #t) "?")
(check-equal? (not "nah") "?")

; The (cond) form evaluates tests in sequence, and will only evaluate the
; expressions that follow the first test that results in #t. The (else)
; clause can be used in a (cond) to handle a default case.
;
; Remember that you can switch bracket styles to help readers not get lost
; in an ocean of parentheses. Square brackets are used in the Racket Guide
; to more strongly emphasize which expressions provided directly to (cond).
(define key "a")
(check-equal?
  (cond
    [(equal? "a" key) 1]
    [(equal? "b" key) 2]
    [else 3])
  "?")
