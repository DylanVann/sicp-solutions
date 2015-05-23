(define (f-recursive n)
  (if (< n 3)
    n
    (+ (f-recursive (- n 1)) (* 2 (f-recursive (- n 2))) (* 3 (f-recursive (- n 3))))))

; Tests
(f-recursive 0)
(f-recursive 1)
(f-recursive 2)
(f-recursive 3)
(f-recursive 4)
(f-recursive 5)
(f-recursive 6)

(define (f-iterative n)
  (define (f-iter a b c n)
    (if (= n 0)
      c
      (f-iter b c (+ c (* 2 b) (* 3 a)) (- n 1))))
  (if (< n 3)
    n
    (f-iter 0 1 2 (- n 2))))

; Tests
(f-iterative 0)
(f-iterative 1)
(f-iterative 2)
(f-iterative 3)
(f-iterative 4)
(f-iterative 5)
(f-iterative 6)