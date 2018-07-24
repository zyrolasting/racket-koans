#lang racket/base

(require rackunit)

;; Start here for some basics.

; define binds an identifier to a value
(define foo 3)
(check-equal? foo "?")

; Racket only prohibits ()[]{}",'`;#|\ characters in identifiers ...
(define 2&--????++ "This identifier is okay.")
(check-equal? 2&--????++ "Yeah, really.")

; ... unless the identifier is surrounded in pipes. Then, anything goes.
(define |()[]{}",'`;#|\| "This identifier is okay too")
(check-equal? |()[]{}",'`;#|\| "The empty identifier is ||")

; Whitespace between meaningful tokens are ignored, but be sure to use
; common sense and consistent indentation.
(
  define
    all

          "over"
          )

; define can be used to create functions (Or "procedures", to follow the docs).
; The first identifier in the list after `define` is the procedure's name.
(define (my-func) "Hello, Racket!")

; You call a procedure by writing an expression leading with the procedure's identifier.
; The value resulting from evaluating the last expression in a procedure's
; body gets returned to the caller.
(check-equal? (my-func) "Hello, World!")

; Additional identifiers specify positional parameters.
(define (add-two-numbers a b) (+ a b))
(check-equal? (add-two-numbers 1 1) "?")

; As expected, you can call procedures and use what they return as arguments.
; Argument expressions are evaluated from left to right.
(check-equal?
  (add-two-numbers (add-two-numbers 1 1) 1)
  "?")

; Racket, being in the Lisp family, applies special rules to some forms
; For example, conditionals like `if` are not evaluated exactly like the
; procedure call above.
;
; (if <test-expr> <expr-if-true> <expr-if-false>)
;
; Instead of evaluating everything from left to right and then invoking `if`,
; the test-expr is evaluated first, and then only the expression matching
; evaluates afterwards. The entire `if` form returns the result of the
; matching expression.
;
; We will cover more "special rules" as we go. The fundamental point is that you
; should not assume everything behaves like a procedure call just because the syntax
; makes a procedure call and a special form look alike.
(check-equal?
  (if (> 2 1) "True: 2 is > 1" "False: 2 <= 1")
  "?")


; Racket allows you to switch up bracket styles freely using {}, [] or () pairs,
; but this should only be done to respect conventions that make code more legibile.
[check-equal? {add-two-numbers 99 1} (* 10 "?")]
