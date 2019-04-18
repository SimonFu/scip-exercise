
(load "utilities/accumulate-seq.scm")
(define (flatmap proc seq)
    (accumulate append '() (map proc seq)))
