(define (cube-root x)
  (define (abs x)
    (if (< x 0)
      (- x)
      x))

  (define (square x) (* x x))

  (define (cube x) (* x x x))
  
  (define (average x y)
    (/ (+ x y)
       2))
  
  (define (good-enough? guess)
    (< (/ (abs (- (cube guess)
                x))
          x)
       0.00001))

  (define (improve guess)
      (average guess (/ (+ (/ x
                              (square guess))
                           (* 2 guess))
                        3)))

  (define (cube-root-iter guess)
    (if (good-enough? guess)
      guess
      (cube-root-iter (improve guess))))

  (cube-root-iter 1.0))

(cube-root 8)
(cube-root 0.000001)
