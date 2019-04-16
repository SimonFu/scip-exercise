(define (map-tree proc t)
    (cond   ((null? t)   '())
            ((pair? t)  (cons   (map-tree proc  (car t))
                                (map-tree proc  (cdr t))))
            (else (proc t))))

(define (square-tree t)
    (map-tree square t))

(square-tree
    (list   1
            (list 2 (list 3 4) 5)
            (list 6 7)))