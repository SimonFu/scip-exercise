(define (last-pair l)
    (cond   ((null? l) (error "Wrong parameter: Empty list!"))
            ((null? (cdr l)) l)
            (else (last-pair (cdr l)))))

(last-pair (list 1 3 5 7))
(last-pair (list 1 9 25 49))
(last-pair '())
(last-pair (list 23 72 149 34))