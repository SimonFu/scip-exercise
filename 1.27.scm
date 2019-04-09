(define (fast-prime? n)
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

    (define (fast-prime-iter? count)
        (cond ((= count n) true)
              ((fermat-test n) (fast-prime-iter? (+ count 1)))
              (else false)))

    (fast-prime-iter? 2))

(fast-prime? 561)
(fast-prime? 1105)
(fast-prime? 1729)
(fast-prime? 2465)
(fast-prime? 2821)
(fast-prime? 6601)