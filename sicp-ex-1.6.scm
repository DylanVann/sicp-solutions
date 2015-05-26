(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

; Tests
(= (new-if (= 2 3) 0 5) 5)
(= (new-if (= 1 1) 0 5) 0)

; Complex test.
(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
       guess
       (sqrt-iter (improve guess x) x)))

; Should return ~4.
(sqrt-iter 1.0 16)

; The mit-scheme interpreter uses applicative-order evaluation.
; The interpreter expands all arguments to a function before evaluating it.
; For new-if this means then-clause and else-clause need to be evaluated before the function runs.
; That means that the else-clase, "(sqrt-iter (improve guess x) x))" will be expanded infinitely.
; This generates the error: Aborting!: maximum recursion depth exceeded.
; The normal (ha, normal) if function is a special form in that it evaluates the predicate before evaluating/expanding the clauses, and only the relevant clause is evaluated/expanded.
