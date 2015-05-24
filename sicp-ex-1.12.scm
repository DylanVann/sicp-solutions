(define (pascal row col)
  (cond ((> col row) 0)
        ((< col 0) 0)
        ((= col 1) 1)
        (else (+ (pascal (- row 1) (- col 1))
            (pascal (- row 1) col)))))

; Tests
; Row 1
(pascal 1 1)
; Row 2
(pascal 2 1)
(pascal 2 2)
; Row 3
(pascal 3 1)
(pascal 3 2)
(pascal 3 3)
; Row 4
(pascal 4 1)
(pascal 4 2)
(pascal 4 3)
(pascal 4 4)
; Row 5
(pascal 5 1)
(pascal 5 2)
(pascal 5 3)
(pascal 5 4)
(pascal 5 5)