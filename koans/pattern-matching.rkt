#lang racket

(require rackunit)

(struct pos (x y z))


(with-handlers
  ([exn:misc:match? (lambda (e) (fail "At least one pattern does not match"))])
  (check-equal?
    (match "?"
      [#\a 'one]
      [#\b 'two]
      [#\c 'three])
    'three
    "Matching on literals")
  (check-equal?
    (match "?"
      [(list (? pos?) (list _ (pos 2 1 (pos _ _ x)))) x])
    10
    "Matching nested contructor")
  (check-equal?
    (match (for/list ([i (in-range 10)]) (if (even? i) '! i))
      ["?" x])
    '(1 3 5 7 9)
    "Matching repeated patterns"))
