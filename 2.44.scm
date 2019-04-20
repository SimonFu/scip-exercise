(define (left-split painter n)
    (if (= n 0)
        painter
        (let ((smaller (left-split painter (- n 1))))
            (beside (below smaller smaller) painter))))