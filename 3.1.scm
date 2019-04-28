(define (make-accumulator init)
    (lambda (x) 
        (begin  (set! init (+ x init))
                init)))

(define A (make-accumulator 5))
(A 10)
(A 10)