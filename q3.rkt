#lang racket
(require typed-stack)
(provide (all-defined-out))

(
 define (evalPostfixExpr [postfix null] [st (empty-stack)])
  (
   cond
    [(empty? postfix) (top st)]
    [(equal? (car postfix) #\+)
     (evalPostfixExpr (cdr postfix) (push (pop (pop st)) (+ (top st) (top (pop st)))))]
    [(equal? (car postfix) #\-)
     (evalPostfixExpr (cdr postfix) (push (pop (pop st)) (- (top (pop st)) (top st))))]
    [(equal? (car postfix) #\*)
     (evalPostfixExpr (cdr postfix) (push (pop (pop st)) (* (top st) (top (pop st)))))]
    [else (evalPostfixExpr (cdr postfix) (push st (car postfix)))]
   ))