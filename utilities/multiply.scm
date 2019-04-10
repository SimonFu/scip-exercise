(define (mul term a next b)
    (if (> a b) 1
                (* (term a)
                   (mul term (next a) next b))))