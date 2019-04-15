(define (pow x n)
    (if (= n 0)  1
                 (* x (pow x (- n 1)))))