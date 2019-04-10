(load "utilities/prime.scm")

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

(search-for-primes 1000000 1000100)
; 1009 1013 1019
; 10007 10009 10037
; 100003 1000019 1000043
; 1000003 1000033 1000037
