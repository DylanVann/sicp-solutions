(define (sum-of-squares-largest-2-of-3 a b c)
  (cond ((and (>= a c) (>= b c)) (+ (* a a) (* b b)))
        ((and (>= a b) (>= c b)) (+ (* a a) (* c c)))
        ((and (>= b a) (>= c a)) (+ (* b b) (* c c)))))

; Tests 
; Choosest largest 2 and squares?
(= (sum-of-squares-largest-2-of-3 1 3 4) 25)
(= (sum-of-squares-largest-2-of-3 4 1 3) 25)
(= (sum-of-squares-largest-2-of-3 3 4 1) 25)
; Handles equal values?
(= (sum-of-squares-largest-2-of-3 4 4 1) 32)
(= (sum-of-squares-largest-2-of-3 4 4 4) 32)