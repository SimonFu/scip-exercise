(load "utilities/accumulate-seq.scm")

(define (dot-product v w)
    (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
    (map    (lambda (x)
                (dot-product x v)) m))

(load "2.36.scm")
(define (transpose m)
    (accumulate-n cons '() m))

(transpose (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9)))