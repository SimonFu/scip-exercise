(load "utilities/rect-1.scm")

(define (circumference r)
    (*  2
        (+  (height r)
            (width r))))

(define (area r)
    (*  (height r)
        (width r)))

(define seg (make-segment (make-point 0 0) (make-point 100 100)))
(define r (make-rect seg))
(area r)
(circumference r)