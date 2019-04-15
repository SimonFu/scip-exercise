(define (make-interval a b)
    (const  (min a b)
            (max a b)))

(define (upper-bound i)
    (cdr i))

(define (lower-bound i)
    (car i))