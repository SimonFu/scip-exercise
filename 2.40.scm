(load "utilities/enumerate-interval.scm")
(load "utilities/flatmap.scm")
(load "utilities/filter.scm")
(load "utilities/prime.scm")

(define (unique-pairs n)
    (flatmap    (lambda (i)
                    (map    (lambda (j)
                                (list i j))
                            (enumerate-interval (+ i 1) n)))
                (enumerate-interval 1 (- n 1))))

(unique-pairs 4)

(define (prime-sum? pair)
    (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
    (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
    (map make-pair-sum
        (filter prime-sum? (unique-pairs n))))

(prime-sum-pairs 6)