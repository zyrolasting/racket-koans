#lang racket/base

(require
  rackunit
  syntax/macro-testing)


(check-not-exn (lambda () ; Make a struct instance to pass these tests.
  (convert-compile-time-error (let ([p "?"])
    (check-pred racketeer? p)
    (check-pred programmer? p)
    (check-pred struct? p)
    (check-pred procedure? set-programmer-salary!)
    (check-equal? (programmer-confusion-level p) 10)
    (check-equal? (racketeer-desire-for-racket-jobs p) 9001))))
  (string-append
    "The struct definition seems wrong. At least one the symbols "
    "Racket creates for the needed struct is not present, or some "
    "other exception was thrown."))
