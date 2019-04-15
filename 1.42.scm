(define (compose f g)
    (lambda (x)
        (f (g x))))

(load "utilities/inc.scm") 
((compose square inc) 6)