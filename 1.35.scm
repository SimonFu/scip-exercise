(define (fixed-point f first-guess)
    (define tolerance 0.000001)
    (define (close-enough? x y)
        (< (abs (- x y)) tolerance))
    (define (try guess)
        (let ((next (f (f guess))))
            (if (close-enough? guess next) 
                (/ (+ guess next) 2)
                (try next))))
                
    (try first-guess))

(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)