#lang racket

(provide (all-defined-out))

(define (getLastHalf lst sz) ; This method takes O(n) time
  (if (equal? sz 0) lst
      (getLastHalf (cdr lst) (- sz 1))))

(define (getFirstHalf lst sz) ; This method takes O(n) time
  (if (equal? sz 0) null
  (append (list (car lst)) (getFirstHalf (cdr lst) (- sz 1)))))

(define (merge lst1 lst2) ; This method again takes O(n) since we're only ever using car and cdr which are O(1)
  (cond
    [(empty? lst1) lst2]
    [(empty? lst2) lst1]
    [(> (car lst1) (car lst2)) (append (list (car lst2)) (merge lst1 (cdr lst2)))]
    [else (append (list (car lst1)) (merge (cdr lst1) lst2))]))

(define (mergesort lst) ; The merge, getFirstHalf and getLastHalf methods take O(n) time each. By master theorem, this
  ; method takes O(nlogn) time
  (cond
    [(equal? (length lst) 0) null]
    [(equal? (length lst) 1) lst]
    [else (merge (mergesort (getFirstHalf lst (floor (/ (length lst) 2)))) (mergesort (getLastHalf lst (floor (/ (length lst) 2)))))]
    ))

