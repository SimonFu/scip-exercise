(define (cons x y)
    (load "utilities/pow.scm")
    (* (pow 2 x) (pow 3 y)))

(define (car z)
    (define (iter x count)
        (let ((r (remainder x 2)))
            (if (= r 0)
                (iter   (/ x 2)
                        (+ count 1))
                count)))
    
    (iter z 0))

(define (cdr z)
    (define (iter x count)
        (let ((r (remainder x 3)))
            (if (= r 0)
                (iter   (/ x 3)
                        (+ count 1))
                count)))
    
    (iter z 0))

(define z (cons 4 5))
(car z)
(cdr z)