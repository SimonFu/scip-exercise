(load "utilities/fixed-point.scm")
(load "utilities/repeated.scm")
(load "utilities/pow.scm")
(load "utilities/average-damp.scm")

(define (root x n)
    (fixed-point    (repeated   (average-damp  (lambda (y) (/   x 
                                                                (pow y (- n 1)))))
                                (/ n 2))
                    1.0))

(root 2 2)
(root 2 4)
(root 16 4)