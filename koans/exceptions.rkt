#lang racket

(require
  racket/undefined
  rackunit
  syntax/macro-testing)

;;; Here we practice exceptions, prompts, aborts and continuations.
;;;
;;; Following exercises:
;;;
;;; 1. Producing contract violation and custom exceptions
;;; 2. Catching exceptions
;;; 3. Prompts, aborts and continuations


;; 1. Producing contract violation and custom exceptions
;;
;; Use a custom exception and exceptions related
;; to contract violations to tell the story of the Sneetches.
(struct sneetch (starred?) #:transparent)

;; Normalizes sneetches depending on belly-star demand.
(define/contract (convert-sneetches stars-upon-thars? sneetches)
  (->i
   ([demand boolean?]
    [inputs (demand) (non-empty-listof (not demand))])
   [_ (demand inputs)
      (and/c
       (non-empty-listof demand)
       (compose (curry = (length inputs)) length))])
  (map (lambda (s) stars-upon-thars?) sneetches))


;; So long the lesson is unlearned,
;; the truth stays unearned.
;; When different, unwise Sneetches come to play,
;; an exception enters the fray.
(define/contract (mingle sneetches lesson-learned?)
  (-> (listof sneetch?) boolean? boolean?)
   "?")

(define/contract (only-starred sneetches)
  (-> any/c any) ; ?
  (filter sneetch-starred? sneetches))

(define/contract (only-unstarred sneetches)
  (-> any/c any) ; ?
  (filter (lambda (s) (not (sneetch-starred? s))) sneetches))


;; Tests tell a short tale,
;; of creatures beyond the pale.
;; But when written just outside of main(),
;; it doesn't feel quite the same.
(check-not-exn (lambda ()
  (convert-compile-time-error (let*
    ([sneetches (map sneetch '(#t #f #t #f #f #t #t #f))]
    [originally-starred (only-starred sneetches)])
      (check-exn exn:fail:racism? (lambda () (mingle sneetches #f)))
      (check-exn exn:fail:contract? (lambda () (convert-sneetches sneetches)))
      (check-not-exn (lambda () (convert-sneetches (only-unstarred sneetches) #t)))
      (check-exn exn:fail:contract? (lambda () (convert-sneetches originally-starred)))
      (check-true (mingle sneetches #t)))))
  "Did you define all of the symbols you needed?")


;; Alright, that's enough of that.

;; 2. Catching exceptions
;; Write with-handlers to pass the
;; below tests without writing a new contract.
(define (loose-div n d)
  (/ n d))

(check-not-exn (lambda ()
  (check-eqv? (loose-div "8" 2) 4)
  (check-eqv? (loose-div 0 0) +inf.0)
  (check-eqv? (loose-div -0 0) -inf.0)
  (check-eqv? (loose-div "cannot" "divide") +nan.0))
  "loose-div should be handling exceptions")

;; 3. Prompts, aborts and continuations


;; Exceptions are powered by an underlying mechanism of prompts, aborts and
;; continuations. If we take a simplified analogy with Algol family languages,
;; 'prompts' in use are a generalization of 'try..catch', 'aborts' are a
;; generalization of 'throw', and continuations are a generalization of some
;; WIP state of computation. These three concepts power the ability to divide
;; up Racket's work, then jump to the dividing lines at the author's
;; discretion.
;;
;; For helpful visual aids, see https://stackoverflow.com/a/29838823/394397

;; Complete and then capture this foldl computation such
;; that you may apply it using only a list.
(define *captured-fold*
  (lambda (l) (fail "Redefine *captured-fold* to pass the test.")))

(call/cc
  (lambda (k)
    (foldl (lambda (a b) "?") "?" '())
    (void)))

(check-eqv? (*captured-fold* '(1 2 3)) 6)
