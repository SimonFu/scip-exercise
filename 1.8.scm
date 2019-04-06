(define (abs x)
  (if (< x 0)
      (- x)
      x))

(define (square x) (* x x))

(define (cube x) (* x x x))

(define (average x y)
  (/ (+ x y)
     2))

(define (good-enough? guess x)
  (< (/ (abs (- (cube guess)
                x))
        x)
     0.00001))
  
(define (improve guess x)
  (average guess (/ (+ (/ x
                          (square guess))
                        (* 2 guess))
                    3)))

(define (cube-root-iter guess x)
  (if (good-enough? guess x)
      guess
      (cube-root-iter (improve guess x) x)))

(define (cube-root x)
  (cube-root-iter 1.0 x))

(cube-root 8)
(cube-root 0.000001)
