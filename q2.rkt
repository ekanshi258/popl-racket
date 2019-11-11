#lang racket
(require typed-stack)
(provide (all-defined-out))

(
 define (postfixAnswer [infix null] [st empty-stack])
  (
   cond
     [(empty? infix) null]
     [(equal? (car infix) #\))
      (if (equal? (top st) #\() (postfixAnswer (cdr infix) (pop st)) (append (list (top st)) (postfixAnswer infix (pop st))))]
     [(equal? (car infix) #\() (postfixAnswer (cdr infix) (push st (car infix)))]
     [(equal? (car infix) #\*)
      (if (equal? (top st) #\*) (append (list (top st)) (postfixAnswer infix (pop st))) (postfixAnswer (cdr infix) (push st (car infix))))]
     [(equal? (car infix) #\+)
      (cond
        [(equal? (top st) #\() (postfixAnswer (cdr infix) (push st #\+))]
        [else (append (list (top st)) (postfixAnswer infix (pop st)))]
      )]
     [(equal? (car infix) #\-)
      (cond
        [(equal? (top st) #\() (postfixAnswer (cdr infix) (push st #\-))]
        [else (append (list (top st)) (postfixAnswer infix (pop st)))]
      )]
     [else (append (list (car infix)) (postfixAnswer (cdr infix) st))]
  
))

(define (infixToPostfix infix)
  (
   postfixAnswer (append (list #\() infix (list #\))) (empty-stack)
   ))
  