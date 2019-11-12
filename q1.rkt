#lang racket
(provide (all-defined-out))
(require racket/trace)
;recursive
(define (sumUpRecursive list)
	(if(empty? list) 0 (+ (car list) (sumUpRecursive (cdr list))))
	)

;tail recursive
(define (sumUpTailRecursion list w)
	(if (empty? list) w (sumUpTailRecursion (cdr list) (+ (car list) w)))
	)
(trace sumUpRecursive sumUpTailRecursion)