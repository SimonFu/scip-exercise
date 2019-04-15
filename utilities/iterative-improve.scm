(define (iterative-improve enough next)
    (lambda (x)
        (define (iter x)
            (if (enough x) x
                           (iter (next x))))
        (iter x)))