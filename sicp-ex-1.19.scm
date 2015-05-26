; 0,1,1,2,3,5,8,13,21
;
; Linear-recursive implementation.
(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1))
                 (fib (- n 2))))))
; Tests
(fib 0)
(fib 1)
(fib 2)
(fib 3)
(fib 4)
(fib 5)
(fib 6)
(fib 7)
(fib 8)

; Iterative implementation.
(define (fib n)
  (define (fib-iter a b n)
    (if (= n 0)
      a
      (fib-iter (+ a b) a (- n 1))))
  (fib-iter 0 1 n))
; Tests
(fib 0)
(fib 1)
(fib 2)
(fib 3)
(fib 4)
(fib 5)
(fib 6)
(fib 7)
(fib 8)

; a <- a + b
; b <- a
;
; Transformed according to:
;
; p = 0
; q = 1
;
; a' = qb + qa + pa
; b' = qa + pb
;
; a'' = qb' + qa' + pa'
; b'' = qa' + pb'
; =>
; a'' = q(qa + pb) + q(qb + qa + pa) + p(qb + qa + pa)
; b'' = q(qa + pb) + p(qa + pb)
; =>
; a'' = (p^2 + 2pq + 2q^2)a + (2pq + q^2)b
; b'' = (2pq + q^2)a + (p^2 + q^2)b
;
; p' = p^2 + q^2
; q' = 2pq + q^2

(define (fib n)
  (define (fib-iter a b p q n)
    (cond ((= n 0) b)
          ((even? n)
           (fib-iter a
                     b
                     (+ (* p p) (* q q))
                     (+ (* 2 p q) (* q q))
                     (/ n 2)))
          (else 
            (fib-iter (+ (* q b) (* q a) (* p a))
                      (+ (* q a) (* p b))
                      p
                      q
                      (- n 1)))))
  (fib-iter 1 0 0 1 n))
; Tests
(fib 0)
(fib 1)
(fib 2)
(fib 3)
(fib 4)
(fib 5)
(fib 6)
(fib 7)
(fib 8)
