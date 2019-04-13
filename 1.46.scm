(load "utilities/iterative-improve.scm")

(define (sqrt x)
    (define (good-enough? guess)
        (<  (abs    (- (square guess)
                    x))
            0.0001))

    (load "utilities/average.scm")

    (define (improve guess)
        (average    guess   (/  x   
                                guess)))

    ((iterative-improve good-enough? improve) x))

(sqrt 2.0)

(define (fixed-point f first-guess)
    (define tolerance 0.000001)
    (define (close-enough? guess)
        (< (abs (- guess (next guess))) tolerance))
    
    (define (next guess)
        (f (f guess)))

    ((iterative-improve close-enough? next) first-guess))

(fixed-point cos 1.0)