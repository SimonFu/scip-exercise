(define (repeated f n)
    (define (iter count)
        (if (= count 0) (lambda (x) x)
                        (lambda (x)
                            (f ((iter (- count 1)) x)))))
    
    (iter n))