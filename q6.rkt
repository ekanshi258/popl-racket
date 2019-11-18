#lang racket

(define (printPathsTailRecursive node . path)
  (cond
    [(null? (rest node)) (display (append (first path) (list(first node)))) (display "\n")]

    [else (for ([child (rest node)])
            (cond
              [(empty? path)  (printPathsTailRecursive child (list (first node)) )]
              [else (printPathsTailRecursive child (append (first path) (list (first node))) )])
            )
 
    ]
   )
)

(printPathsTailRecursive '(1 (2 (6) (7 (8))) (3 (9 (10) (11))) (4) (5)))

