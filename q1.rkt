#lang racket

;recursive
(define (sumUpRecursive list)
	(if(empty? list) 0 (+ (car list) (sumUpRecursive (cdr list))))
	)

;tail recursive
(define (sumUpTailRecursive list [acc 0])
	(if (empty? list) acc (sumUpTailRecursive (cdr list) (+ (car list) acc)))
	)