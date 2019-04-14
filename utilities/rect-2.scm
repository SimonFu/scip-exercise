(load "utilities/segment.scm")

(define (make-rect s)
    (let (  (topleft (start-segment s))
            (bottomright (end-segment s)))
        (cons topleft bottomright)))

(define (width r)
    (let (  (topleft (car r))
            (bottomright (cdr r)))
        (-  (x-point bottomright)
            (x-point topleft))))

(define (height r)
    (let (  (topleft (car r))
            (bottomright (cdr r)))
        (-  (y-point bottomright)
            (y-point topleft))))