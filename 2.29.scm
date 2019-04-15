(define (make-mobile left right)
    (list left right))

(define (make-branch length structure)
    (list length structure))

(define (left-branch m)
    (car m))

(define (right-branch m)
    (car (cdr m)))

(define (branch-length b)
    (car b))

(define (branch-structure b)
    (car (cdr b)))

(define (total-weight m)
    (if (pair? (branch-structure m))   
                        (+  (total-weight (branch-structure (left-branch m)))
                            (total-weight (branch-structure (right-branch m))))
                        (car (branch-structure m))))

(define (mobile-balance? m)
    (define (torque m)
        (*  (total-weight m)
            (branch-length m)))
   (if (pair? (branch-structure m)) 
            (and    (=  (torque (left-branch m))
                        (torque (right-branch m)))
                    (mobile-balance? (left-branch m))
                    (mobile-balance? (right-branch m)))
            true))