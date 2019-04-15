(define (double f)
    (lambda (x)
        (f (f x))))

(load "utilities/inc.scm") 

((double inc) 2)
(((double (double double)) inc) 5)
