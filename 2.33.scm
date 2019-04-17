(load "utilities/accumulate-seq.scm")

(define (map p sequence)
    (accumulate (lambda (x y)
                    (cons   (p x)
                            y))
                '()
                sequence))

(map square (list 1 2 3 4 5 6))

(define (append seq1 seq2)
    (accumulate cons
                seq2
                seq1))

(append (list 1 2 3 4) (list 5 6 7 8 9))

(load "utilities/inc.scm")
(define (length sequence)
    (accumulate (lambda (x y)
                    (inc y))
                0
                sequence))

(length (list 1 2 3 4 5 6))