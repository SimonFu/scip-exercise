(load "utilities/enumerate-interval.scm")
(load "utilities/flatmap.scm")
(load "utilities/filter.scm")
(load "2.39.scm")

(define empty-board '())

(define (safe? k positions)
    (let ((pos  (car (reverse positions))))
        (define (iter i positions)
            (if (= i k) true
                        (and    (not    (= (car positions)
                                        pos))
                                (not    (=  (abs (- pos (car positions)))
                                            (abs (- k i))))
                                (iter (+ i 1) (cdr positions)))))
        (iter 1 positions)))

(define (adjoin-position new-row k rest-of-queens)
    (append rest-of-queens (list new-row)))

(define (queens board-size)
    (define (queen-cols k)
        (if (= k 0)
            (list empty-board)
            (filter
                (lambda (positions) (safe? k positions))
                (flatmap
                    (lambda (rest-of-queens)
                        (map    (lambda (new-row)
                                    (adjoin-position
                                        new-row k rest-of-queens))
                                (enumerate-interval 1 board-size)))
                    (queen-cols (- k 1))))))
(queen-cols board-size))

(queens 8)