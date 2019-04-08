(define (prime? n) 
    (define (smallest-divisor n)
        (define (divide? a b) (= (remainder a b) 0))

        (define (find-divisor n test)
            (cond ((> (square test) n) n)
                  ((divide? n test) test)
                  (else (find-divisor n (+ test 1)))))
                
        (find-divisor n 2))

    (= (smallest-divisor n) n))

(define (timed-prime-test n)
    (define (report-time elapsed-time)
        (display " *** ")
        (display elapsed-time))

    (define (start-prime-test n start-time)
        (if (prime? n)
            (report-time (- (runtime) start-time))))

    (display "\n")
    (display n)
    (start-prime-test n (runtime)))

(define (search-for-primes min max)
    (define (next-odd n)
        (if (even? n) (+ n 1) n))

    (define (search-for-primes-iter test)
        (timed-prime-test test)
        (if (< test max)
            (search-for-primes-iter (next-odd (+ test 2)))))
             
    (search-for-primes-iter (next-odd min)))

(search-for-primes 100000000 100001000)
