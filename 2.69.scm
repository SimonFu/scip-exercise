(load "code-tree.scm")

(define (successive-merge set)
    (if (null? (cdr set))
        (car set)
        (successive-merge   (let (  (x1 (car set))
                                    (x2 (cadr set)))
                                (if (> (weight x1) (weight x2))
                                    (adjoin-set (make-code-tree x2 x1) (cddr set))
                                    (adjoin-set (make-code-tree x1 x2) (cddr set)))))))

(define (generate-huffman-tree pairs)
    (successive-merge (make-leaf-set pairs)))

;(define l (list (list 'C 1) (list 'D 1) (list 'B 2) (list 'A 4)))
;(generate-huffman-tree l)