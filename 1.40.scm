(load "utilities/newtons-method.scm")
(load "utilities/cube.scm")

(define (cubic a b c)
    (lambda (x) 
        (+  (cube x)
            (* a (square x))
            (* b x)
            c)))

(newtons-method (cubic 2 2 2) 1)
