(define (monte-carlo trials experiment)
    (define (iter trials-remaining trials-passed)
        (cond   ((= trials-remaining 0)
                    (/ trials-passed trials))
                ((experiment)
                    (iter   (- trials-remaining 1)
                            (+ trials-passed 1)))
                (else
                    (iter   (- trials-remaining 1)
                            trials-passed))))
    (iter trials 0))

(define (random-in-range low high)
    (let ((range (- high low)))
        (+ low (random range))))

(define (estimate-integral p x1 x2 y1 y2 trials)
    (define (cesaro-test)
        (p (random-in-range x1 x2) (random-in-range y1 y2)))
    (*  (abs (- x2 x1))
        (abs (- y2 y1))
        (monte-carlo trials cesaro-test)))

(define (estimate-pi)
    (define (predict x y)
        (<= (+  (square (- x 5.0))
                (square (- y 7.0)))
            (square 3.0)))

    (/ (estimate-integral predict 2.0 8.0 4.0 10.0 100000) (square 3)))

(estimate-pi)