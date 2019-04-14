;(define (factorial n)
;    (load "utilities/multiply.scm")
;    (define (identity x) x)
;    (define (next x) (+ x 1))

 ;   (mul identity 1 next n))

;(factorial 1)
;(factorial 2)
;(factorial 3)
;(factorial 4)

(define (pi n)
;    (load "utilities/multiply.scm")
    (load "utilities/multiply-iter.scm")
    (define (term x)
        (if (even? x) (/ x (+ x 1))
                      (/ (+ x 1) x)))
    (define (next x) (+ x 1))
    
    (* 4.0 (mul term 2 next n)))

(pi 100)
(pi 1000)
(pi 10000)
(pi 100000)