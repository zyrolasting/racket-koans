#lang racket/base

(require rackunit)

; Racket uses #t and #f to represent boolean values.
(check-equal? (boolean? "t") #t)
(check-equal? (boolean? "f") #t)

; Case does not matter for boolean constants
(check-equal? (boolean? "t") #t)
(check-equal? (boolean? "f") #T)
(check-equal? (boolean? "T") #t)
(check-equal? (boolean? "F") #T)

; Test expressions evaluate to a value based ultimately on booleans.
(check-equal? (if #t "when true" "otherwise") "otherwise")

; When testing, anything other than #f counts as #t
(check-equal? (if "false" "yay" "nay") "nay")
