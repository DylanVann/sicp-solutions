; The program from the book.
;
; (define (count-change amount) (cc amount 5))
;
; (define (cc amount kinds-of-coins)
;   (display "\n( cc ")
;   (display amount)
;   (display " ")
;   (display kinds-of-coins)
;   (display ")")
;   (cond ((= amount 0) 1)
;         ((or (< amount 0) (= kinds-of-coins 0)) 0)
;         (else (+ (cc amount
;                      (- kinds-of-coins 1))
;                  (cc (- amount
;                         (first-denomination
;                           kinds-of-coins))
;                      kinds-of-coins)))))
;
; (define (first-denomination kinds-of-coins)
;   (cond ((= kinds-of-coins 1) 1)
;         ((= kinds-of-coins 2) 5)
;         ((= kinds-of-coins 3) 10)
;         ((= kinds-of-coins 4) 25)
;         ((= kinds-of-coins 5) 50)))
;
; Tests
; (= (count-change 100) 292)
;
; A version of the program that draws the tree.
;
; Modified version of code by Toby Thain <toby@telegraphics.com.au>
;
; To regenerate the graph you'll need to have the dependencies:
;
; ```
; port install graphviz chicken
; ```
;
; Then run:
;
; ```
; make sicp-ex-1.14
; ```

(define (count-change amount coins parent-id branch)
  (define (pr lst) (for-each display lst))
  (define (graph-edge t p edge-label)
    (pr (list t " -> " p))
    (if edge-label (pr (list " [label=\"  " edge-label "\"]")))
    (display #\;)
    (newline))
  (define (value-node t c n)
    (pr (list t " [label=" n ",fillcolor=" c "];"))
    (newline)
    n)
  (define (combine-node t amount coins n)
    (pr (list t " [label=\"" amount #\space coins "\",shape=box];"))
    (newline)
    n)

  (let ((id (if branch (+ (* parent-id 2) branch) parent-id)))
    (if (> id 1)
      (graph-edge id parent-id (if (= branch 1) (car coins) #f)))
    (cond 
      ; one solution! coins chosen equal to amount
      ((= amount 0)  (value-node id 1 1))  
      ; no solution, last coin was larger than amount
      ((< amount 0)  (value-node id 2 0))  
      ; no more solutions, used all coin types
      ((null? coins) (value-node id 4 0))
      (else (combine-node id amount coins
                          (+
                            ; count ways of making change without this coin:
                            (count-change amount (cdr coins) id 0)
                            ; use this coin. count ways for remaining amount:
                            (count-change (- amount (car coins)) coins id 1)))))))

(display "digraph recursion_tree {")
(newline)

(count-change 11 '(50 25 10 5 1) 1 #f)

(display "}")
(newline)

; #Orders of growth.
;
; ##Space
;
; The space oog is proportional to the height of the tree,
; which is proportional to the amount to be changed: O(n).
;
; ##Time
;
; Each additional denomination creates an additional subtree.
; The time complexity is O(n^k), where k is the number of denominations.