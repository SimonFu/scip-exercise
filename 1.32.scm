(define (sum term a next b)
    (load "utilities/accumulate-iter.scm")
    (accumulate + 0 term a next b))

(define (mul term a next b)
    (load "utilities/accumulate-iter.scm")
    (accumulate * 1 term a next b))

(define (pi n)
    (define (term x)
        (if (even? x) (/ x (+ x 1))
                      (/ (+ x 1) x)))
    (define (next x) (+ x 1))
    
    (* 4.0 (mul term 2 next n)))

(pi 100)
(pi 1000)
(pi 10000)
(pi 100000)