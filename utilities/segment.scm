(load "utilities/point.scm")

(define (make-segment start end)
    (cons start end))

(define (start-segment s)
    (car s))

(define (end-segment s)
    (cdr s))

(define (midpoint-segment s)
    (let    (   (start (start-segment s))
                (end (end-segment s)))
        (cons   (/  (+  (x-point start)
                        (x-point end)) 
                    2)
                (/  (+  (y-point start)
                        (y-point end)) 
                    2))))

(define (print-point p)
    (display "\n")
    (display "(")
    (display (x-point p))
    (display ",")
    (display (y-point p))
    (display ")"))