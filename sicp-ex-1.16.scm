; This only works for integers.
(define (square x)
  (* x x))

(define (fast-exp b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-exp b (/ n 2))))
        (else (* b (fast-exp b (- n 1))))))
;Tests
(= (fast-exp 2 2) 4)
(= (fast-exp 2 3) 8)
(= (fast-exp 3 2) 9)
(= (fast-exp 4 2) 16)

(define (faster-exp b n)
  (define (faster-exp-iter b n a)
    (cond ((= n 0) a)
          ((even? n) (faster-exp-iter (square b) (/ n 2) a))
          (else (faster-exp-iter b (- n 1) (* b a)))))
  (faster-exp-iter b n 1))
;Tests
(= (faster-exp 2 2) 4)
(= (faster-exp 2 3) 8)
(= (faster-exp 3 2) 9)
(= (faster-exp 4 2) 16)
