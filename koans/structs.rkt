#lang racket/base

(require rackunit)


; Produce a single struct that passes all assertions.
(let ([p "?"])
  (check-pred racketeer? p)
  (check-pred programmer? p)
  (check-pred struct? p)
  (check-pred procedure? set-programmer-salary!)
  (check-equal? (programmer-confusion-level p) 10)
  (check-equal? (racketeer-desire-for-racket-jobs p) 9001))
