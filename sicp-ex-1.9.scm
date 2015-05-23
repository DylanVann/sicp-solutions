(define (inc a)
  (+ a 1))

; Test inc
(inc 5)

(define (dec a)
  (- a 1))

; Test dec
(dec 5)

(define (add-a a b)
  (if (= a 0) b (inc (add-a (dec a) b))))

; Test add-a
(add-a 3 5)

; Expanding add-a with substitution model.
;
; (add-a 3 5)
; (inc (add-a 2 5))
; (inc (inc (add-a 1 5)))
; (inc (inc (inc (add-a 0 5))))
; (inc (inc (inc 5)))
; (inc (inc 6))
; (inc 7)
; 8
;
; This is a linear recursive process.

(define (add-b a b)
  (if (= a 0) b (add-b (dec a) (inc b))))

; Test add-b
(add-b 3 5)

; Expanding add-b with substitution model.
;
; (add-b 3 5)
; (add-b 2 6)
; (add-b 1 7)
; (add-b 0 8)
; 8
;
; This is a linear recursive process.
