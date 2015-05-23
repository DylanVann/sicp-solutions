(define (p) (p))
(define (test x y)
  (if (= x 0) 0 y))

; The mit-scheme interpreter uses applicative-order evaluation, so this function will never terminate.
; Normal-order evaluation would not need to try to evaluate (p) and would return 0.
(test 0 (p))