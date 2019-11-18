#lang racket

(define (printPathsTailRecursive node path)  (display (append (first path) (list(first node)))) (display "\n"))


(define (printPathsRecursive node . path)
  (cond
    [(null? (rest node)) (printPathsTailRecursive node path)]

    [else (for ([child (rest node)])
            (cond
              [(empty? path)  (printPathsRecursive child (list (first node)) )]
              [else (printPathsRecursive child (append (first path) (list (first node))) )])
            )
 
    ]
   )
)

(printPathsRecursive '(1 (2 (6) (7 (8))) (3 (9 (10) (11))) (4) (5)))

