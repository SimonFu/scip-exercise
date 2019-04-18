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

(define (matrix-*-matrix m n)
    (let ((cols (transpose n)))
        (map (lambda (x)
            (map (lambda (y)
                    (dot-product x y)) cols)) m)))

(matrix-*-matrix (list (list 1 2 3) (list 4 5 6) (list 6 7 8)) (list (list 1 2 3) (list 4 5 6) (list 6 7 8)))