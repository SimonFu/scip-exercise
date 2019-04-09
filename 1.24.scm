(define (fast-prime? n times)
    (define (expmod base exp m)
        (cond ((= exp 0) 1)
            ((even? exp) (remainder (square (expmod base 
                                                    (/ exp 2) 
                                                    m)) 
                                    m))
            (else (remainder (* base 
                                (expmod base 
                                        (- exp 1) 
                                        m)) 
                              m))))

    (define (fermat-test n)
        (define (try-it a)
            (= (expmod a n n) a))
        
        (try-it (+ 1 (random (- n 1)))))

    (cond ((= times 0) true)
          ((fermat-test n) (fast-prime? n (- times 1)))
          (else false)))

(define (timed-prime-test n)
    (define (report-time elapsed-time)
        (display " *** ")
        (display elapsed-time))

    (define (start-prime-test n start-time)
        (if (fast-prime? n 10)
            (report-time (- (runtime) start-time))))

    (display "\n")
    (display n)
    (start-prime-test n (runtime)))

(timed-prime-test 1000003)
(timed-prime-test 1000033)