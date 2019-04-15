(define (fringe l)
    (cond   ((null? l) '())
            ((pair? (car l)) (append (fringe (car l)) (fringe (cdr l))))
            (else (cons (car l)
                        (fringe (cdr l))))))

(define x (list (list 1 2) (list 3 4)))
(fringe x)
(fringe (list x x))