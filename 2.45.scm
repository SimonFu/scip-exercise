(define (split combine1 combine2)
    (lambda (painter n)
        (if (= n 0)
            painter
            (let ((smaller ((split combine1 combine2) painter (- n 1))))
                (combine1 painter (combine2 smaller smaller))))))