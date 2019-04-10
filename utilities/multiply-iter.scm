(define (mul term a next b)
    (define (mul-iter a result)
        (if (> a b) result
                    (mul-iter (next a) (* result (term a)))))
    (mul-iter a 1))