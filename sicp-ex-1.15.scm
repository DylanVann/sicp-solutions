(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define n 0)
(define (sine angle)
  (set! n (+ n 1))
  (newline)
  (display n)
  (if (not (> (abs angle) 0.1))
    angle
    (p (sine (/ angle 3.0)))))

(sine 12.15)

; The angle is divided by three until it is small enough to approximate.
;
; O(log(n)) in space and time.
