; This only works for integers.
(define (faster-exp b n)
  (define (faster-exp-iter b n a)
    (cond ((= n 0) a)
          ((even? n) (faster-exp-iter (* b b) (/ n 2) a))
          (else (faster-exp-iter b (- n 1) (* b a)))))
  (faster-exp-iter b n 1))

(= (faster-exp 2 2) 4)
(= (faster-exp 2 3) 8)
(= (faster-exp 3 2) 9)
(= (faster-exp 4 2) 16)
