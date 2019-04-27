(load "2.67.scm")
(load "2.69.scm")
(load "2.68.scm")

(define l (list (list 'BOOM 1) (list 'WAH 1) (list 'A 2) (list 'GET 2) (list 'JOB 2) (list 'SHA 3) (list 'YIP 9) (list 'NA 16)))
(define tree (generate-huffman-tree l))

(define message '(Get a job Sha na na na na na na na na Get a job Sha na na na na na na na na Wah yip yip yip yip yip yip yip yip yip Sha boom))

(decode (encode message tree) tree)