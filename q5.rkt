#lang racket

(define (makeTree value . children)
  (cond
    [(empty? children) (list value)]
    [else (append (list value) children)])
)