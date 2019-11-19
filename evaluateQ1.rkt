#lang racket
;(require racket/include)
(require "q1.rkt" racket/trace)
(sumUpRecursive '(1 2 3 4))
(sumUpTailRecursion '(1 2 3 4) 0)
