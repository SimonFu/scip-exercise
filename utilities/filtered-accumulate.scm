(define (filtered-accumulate combiner null-value term a next b predict)
    (define (iter a result)
        (if (> a b) result
                    (iter (next a)
                          (if (predict a) (combiner result (term a))
                                                 result))))

    (iter a null-value))