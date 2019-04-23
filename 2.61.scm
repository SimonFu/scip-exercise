(define (adjoin-set x set)
    (cond   ((null? set)   (list x))
            ((> (car set) x)   (cons x set))
            (else (cons (car set)
                        (adjoin-set x (cdr set))))))

(adjoin-set 7 (list 1 4 8 9 15))