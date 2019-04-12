(load "utilities/cont-frac-iter.scm")

(+ (cont-frac (lambda (x) 1.0)
           (lambda (x) 
                (let ((r (remainder (- x 2) 3)))
                    (cond ((< x 3) x)
                          ((= r 0) (* 2 (+ (/ (- x 
                                                 2) 
                                              3)
                                           1)))
                          (else 1))))
           12)
   2)