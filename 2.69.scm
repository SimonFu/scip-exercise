(load "code-tree.scm")

(define (adjoin-tree x tree)
    (cond   ((null? tree) x)
            ((leaf? tree) 
                (if (< (weight x) (weight tree))
                    (make-code-tree x tree)
                    (make-code-tree tree x)))
            ((> (weight x) (weight tree)) (make-code-tree   tree
                                                            x))
            (else (make-code-tree   (adjoin-tree x  (left-branch tree))
                                                    (right-branch tree)))))

(define (successive-merge set)
    (define (iter set tree)
        (if (null? set) tree
                        (let ((x (car set)))
                            (iter (cdr set) (adjoin-tree x tree)))))
    (iter (cddr set) (make-code-tree (car set) (cadr set))))

(define (generate-huffman-tree pairs)
    (successive-merge (make-leaf-set pairs)))

(define l (list (list 'C 1) (list 'D 1) (list 'B 2) (list 'A 4)))

(generate-huffman-tree l)