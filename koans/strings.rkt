#lang racket ; It's not racket/base this time. Why?

(require rackunit)


; Racket has mutable and immutable strings.
(check-equal? (immutable? "Giraffe") "?")
(check-equal? (immutable? (make-string 10 #\a)) "?")
(check-equal? (immutable? (string #\a #\b #\c)) "?")
(check-equal? (immutable? (string-copy (string))) "?")

(define dotphabet
    (build-string 26 (lambda (i)
        (if (even? i)
            (integer->char (+ 65 i))
            #\.))))

; When test results guide you, these are gimmes.
(check-equal? (string-ref dotphabet 8) "?")
(check-equal? (string-ref dotphabet 19) "?")
(check-eqv? (string-length dotphabet) "?")
(check-equal? (string-downcase dotphabet) "?")

; Without mutating `dotphabet`, produce the string shown using a single expression.
(check-equal? "?" "u#s#q")
