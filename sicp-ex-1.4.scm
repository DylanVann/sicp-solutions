(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; Returns a plus the absolute value of b.
; The if statement chooses whether to use the + or - operator depending on the sign of b.

; Tests
(= (a-plus-abs-b 6 3) 9)
(= (a-plus-abs-b 6 -3) 9)