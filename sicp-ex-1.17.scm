; The given algorithm.
(define (* a b)
  (if (= b 0)
    0
    (+ a (* a (- b 1)))))
; Tests
(= (* 2 3) 6)
(= (* 3 2) 6)

; Modified version.
(define (double x) (+ x x)) 
(define (halve x) (/ x 2)) 
(define (* a b)
  (cond
    ((= b 0) 0)
    ((even? b) (* (double a) (halve b)))
    (else (+ a (* a (- b 1))))))
; Tests
(= (* 2 3) 6)
(= (* 3 2) 6)
