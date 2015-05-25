(define (loop f i n)
  (display "\n")
  (display (f i))
  (if (not (= i n))
    (loop f (+ i 1) n)))

(define (^ base exponent)
  (define (exponent-iter exponent accumulator)
    (if (= exponent 0)
      accumulator
      (exponent-iter (- exponent 1) (* accumulator base))))
  (exponent-iter exponent 1))

; Tests
(= (^ 2 3) 8)
(= (^ 3 2) 9)

; Actually, mit-scheme has a power function.
(= (expt 2 3) 8)
(= (expt 3 2) 9)

(define phi (/ (+ 1 (sqrt 5)) 2))

(define (f n)
  (/ (^ phi n) (sqrt 5)))
; Tests
(loop f 0 10)

; Recursive fib function.
(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1))
                 (fib (- n 2))))))
;Tests
(loop fib 0 10)

; Iterative fib function.
(define (fib n)
  (define (fib-iter a b count)
    (if (= count 0)
      b
      (fib-iter (+ a b) a (- count 1))))
  (fib-iter 1 0 n))
; Tests
(loop fib 0 10)

; We'll check to see if the values of f are within 0.5 of fib.

(define (f-tester n)
  (display "\n")
  (display (fib n))
  (display " - ")
  (display (f n)))

(loop f-tester 0 10)

; They seem to be.
;
; LATER: Maybe I'll do the proof later...
