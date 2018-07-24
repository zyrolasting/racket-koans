#lang racket/base

(require rackunit)

; See https://docs.racket-lang.org/guide/characters.html

(check-equal?
  (char->integer #\u0110)
  "?")

(check-equal?
  (integer->char 72)
  "?")

; Classify these characters: https://docs.racket-lang.org/reference/characters.html#%28def._%28%28quote._~23~25kernel%29._char-alphabetic~3f%29%29
; Challenge: Use each character classification predicate once.
(check-pred "?" #\,)
(check-pred "?" #\a)
(check-pred "?" #\u03A3)
(check-pred "?" #\tab)
(check-pred "?" #\0002)
(check-pred "?" #\J)
(check-pred "?" #\newline)
(check-pred "?" #\z)
(check-pred "?" #\6)
(check-pred "?" #\u1FA8)
(check-pred "?" #\u002B)
