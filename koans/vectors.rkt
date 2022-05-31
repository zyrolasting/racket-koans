#lang racket/base

(require rackunit)

; Vectors resemble lists, but work differently. You can express them
; using the #(value value ...) notation, or by calling `vector`.

(define letters/literal #("a" "b" "c"))
(define letters/runtime (vector "a" "b" "c"))
(check-equal? letters/literal letters/runtime)

(check-equal? '? (vector? letters/literal))
(check-equal? '? (vector? letters/runtime))

; The way you make a vector affects whether you can mutate (change)
; the vector later.
(check-equal? '? (immutable? letters/literal))
(check-equal? '? (immutable? letters/runtime))

; Vectors have constant time access and update, meaning the size of
; the vector does not slow down how quickly you can access or change
; an individual element. Why do you think these operations are fast?
(check-equal? "?" (vector-ref letters/literal 1))
(vector-set! letters/runtime 2 (string-upcase (vector-ref letters/literal 0)))
(check-equal? "?" (vector-ref letters/runtime 2))

; Vector literals may specify their own length.
; What happens if you write #3(a b c d)?
(check-equal? "?" #3())
(check-equal? "?" #3(a))
(check-equal? "?" #3(a b))
(check-equal? "?" #3(a b c))
