; Linear-recursive version.
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

; Iterative version.
(define (* a b)
  (define (*-iter a b acc)
    (cond
      ((= b 0) acc)
      ((even? b) (*-iter (double a) (halve b) acc))
      (else (*-iter a (- b 1) (+ acc a)))))
  (*-iter a b 0))
; Tests
(= (* 2 3) 6)
(= (* 3 2) 6)
