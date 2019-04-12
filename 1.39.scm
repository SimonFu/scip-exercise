(define (tan-cf x k)
    (load "utilities/cont-frac-iter.scm")
    (cont-frac (lambda (y)
                (if (= y 1) x 
                    (* (square x)
                       -1.0)))
               (lambda (y) 
                (+ (* (- y 1) 
                      2) 
                   1))
               k))

(tan-cf (/ 3.14159265359 4) 1000)