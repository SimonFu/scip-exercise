(define (sum-square-prime a b)
    (load "utilities/filtered-accumulate.scm")
    (load "utilities/inc.scm")
    (load "utilities/prime.scm")
    (filtered-accumulate + 0 square a inc b prime?))

(sum-square-prime 2 1000)

(define (product-relative-prime n)
    (load "utilities/filtered-accumulate.scm")
    (load "utilities/inc.scm")
    (load "utilities/identity.scm")
    (define (relative-prime? a)
        (= (gcd n a) 1))
    (filtered-accumulate * 1 identity 1 inc n relative-prime?))

(product-relative-prime 10)