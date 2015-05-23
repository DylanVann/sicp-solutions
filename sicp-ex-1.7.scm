(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
       guess
       (sqrt-iter (improve guess x) x)))

; Good enough when the difference is less than a small fraction of guess.
(define (improved-good-enough? guess x) 
  (< (/ (abs (- (square guess) x)) guess) (* guess 0.0001))) 

(define (improved-sqrt-iter guess x)
  (if (improved-good-enough? guess x)
       guess
       (improved-sqrt-iter (improve guess x) x)))

; Tests - improved-good-enough?
; Testing improved-good-enough? first because the good-enough? tests will result in an infinite loop.
; Square-rooting a 'normal' number (9).
(sqrt 16)
(sqrt-iter 1.0 16)
; Square rooting a 'very small' number (0.0016).
(sqrt 0.0016)
(sqrt-iter 1.0 0.0016)
; Square rooting a 'very large' number (160000000000000000000000000000000000000).
; Returns a 'relatively' accurate result.
(sqrt 160000000000000000000000000000000000000)
(improved-sqrt-iter 1.0  160000000000000000000000000000000000000)

; Tests - good-enough?
; Square-rooting a 'normal' number (9).
(sqrt 16)
(sqrt-iter 1.0 16)
; Square rooting a 'very small' number (0.0016).
(sqrt 0.0016)
(sqrt-iter 1.0 0.0016)
; Square rooting a 'very large' number (160000000000000000000000000000000000000).
; The improve function will cause the guess to oscillate around the precise value without having a small enough error to satisfy good-enough?.
; This is due to the limited precision of floating point numbers.
(sqrt 160000000000000000000000000000000000000)
(sqrt-iter 1.0  160000000000000000000000000000000000000)
