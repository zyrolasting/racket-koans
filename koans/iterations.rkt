#lang racket

(require rackunit)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Iterations with side-effects

(define mutable '())
(define sequences (list
  '(#\a #\b #\c)
  #(#\a #\b #\c)
  "abc"
))

;; `for` iterates over sequences, and sequences are a supertype of many other types,
;; making it flexible for writing loops for many purposes.
;; https://docs.racket-lang.org/reference/sequences.html
(for ([seq sequences]) "?")

(check-equal? mutable '(#\c #\b #\a #\c #\b #\a #\c #\b #\a))

;; `for` forms support stepping through multiple sequences, stopping
;; at the end of the first seqeunce to run out of elements.
(define char-int-display-strings '())
(for ([ch mutable] [i "?"]) "?")

(check-equal?
  char-int-display-strings
  '("a = 97" "b = 98" "c = 99"))


;; for* is a shorthand for nesting loops.
(define colored-toys '())
(define colors '("red" "green"))
(define toys '("marble" "train" "doll"))
(for* ([col "?"] [toy "?"]) "?")

(check-equal?
  colored-toys
  '("red marble"
    "red train"
    "red doll"
    "green marble"
    "green train"
    "green doll"))


;; You can use #:when and #:unless to control when the `for` body evaluates.
(for ([toy colored-toys]
    #:when "?")
  (check-true (string-prefix? toy "red")))

(for ([toy colored-toys]
    #:unless "?")
  (check-true (string-suffix? toy "doll")))

;; Bonus: Rewrite the above two tests with `for*`

;; `#:break` (or `#:final`) stops the iteration outright when its test returns #t.
(define counter 0)
(for ([i (in-range 10000)])
   #:break "?"
   (set! counter (add1 counter)))
(check-equal? counter 101)


;; You can bindings to multiple values where appropriate
(for ([(k v) (hash (first colors) (second toys))])
  (check-equal? k "?")
  (check-equal? v "?"))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Iterations with no side-effects

;; `for` has variants with all of the same powers shown above, but need not
;; rely on side-effects.

;; `for/list` creates a list in terms of another list. This implements comprehensions.
(check-equal?
  (for/list ([i "?"]) "?")
  '(1 9 25))

;; Comprehensions need not return lists. Needless to say there are a lot
;; of for/whatever functions used to generate sequences.
;; Build this one from scratch.
(check-equal?
  (for*/vector () "?")
  #("a1" "a2" "b1" "b2" "c1" "c2" "c3" "c4"))


;; But don't get the impression that the part of the identifier following `/`
;; is always a type. Sometimes the for/... form being used are shorthands for
;; flow control or full iteration patterns. For example, `for/and` and
;; `for/or` use `and` and `or` as means to break and return a result causing
;; said break.
(check-eqv? (for/and ([n (in-range 10)]) n) "?")
(check-eqv? (for/or ([n (in-range 10)]) n) "?")


;; `for/fold` and `for*/fold` capture the iteration pattern in which you accumulate
;; results into a value.
(define operands (in-range 0))

(check-eqv?
  (for/fold ([sum 0]) ([i operands]) (+ sum i))
  5050)

;; To further emphasize the point that some `for/...` forms summarize iteration patterns,
;; for/foldl accumulating a sum of values like the above is already built-in.
(check-eqv?
  (for/sum ([total operands]) total)
  5050)

;; So for/foldl is used to capture a common use of `for`,
;; and `for/sum` is used to capture a common use of `for/foldl`
;; The takeaway here is that before you write a complicated loop,
;; check the Racket reference and see if there's a clearer way
;; to express what you are doing.


;; To finish this up, gleen the pattern from the given data structure and
;; express a comprehension that produces it. You may use `let` or `let*`
;; if you need it. Avoid side-effects.
(check-equal?
  "?"
  (hash
    #\a '(1 2 3 4 5)
    #\b #(1 4 9 16 25)
    #\c "bdcea")) ; Hint: `#\c`'s string has a mathematical relationship
                  ; to both the keys AND values in this hashmap
