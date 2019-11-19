#lang racket

(define (printPathsRecursive node)
  (cond
    [(null? (rest node)) (list (list (first node))) ]
    [else (map (lambda (pathsToNode) (append (list (first node)) pathsToNode))

     (append-map (lambda (child) (printPathsRecursive child))
                      (rest node)))]
    )
)

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

(printPathsRecursive '(1 (2 (6) (7 (8))) (3 (9 (10) (11))) (4) (5)))

(printPathsTailRecursive '(1 (2 (6) (7 (8))) (3 (9 (10) (11))) (4) (5)))