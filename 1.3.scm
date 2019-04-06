(define (square x) (* x x))

(define (sum_larger_two_square x y z) 
    (cond ((and (< x y) (< x z)) (+ (square y) (square z)))
          ((and (< y x) (< y z)) (+ (square x) (square z)))
          ((and (< z x) (< z y)) (+ (square x) (square y)))
          (else (+ (square x) (square y)))))

(sum_larger_two_square 4 4 4)