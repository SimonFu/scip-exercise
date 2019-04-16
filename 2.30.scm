(define (square-tree t)
    (cond   ((null? t) '())
            ((pair? t) (cons    (square-tree (car t))
                                (square-tree (cdr t))))
            (else (square t))))

(square-tree
    (list   1
            (list 2 (list 3 4) 5)
            (list 6 7)))

(load "utilities/map.scm")
(define (square-tree t)
    (map    (lambda (x)
                (if (pair? x) 
                    (square-tree x)
                    (square x)))
            t))

(square-tree
    (list   1
            (list 2 (list 3 4) 5)
            (list 6 7)))