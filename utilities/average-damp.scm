(define (average-damp f)
    (load "utilities/average.scm")
    (lambda (x) (average x (f x))))