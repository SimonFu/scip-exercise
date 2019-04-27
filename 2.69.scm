(load "code-tree.scm")

(define (adjoin-tree x tree)
    (cond   ((null? tree) x)
            ((leaf? tree) 
                (if (< (weight x) (weight tree))
                    (make-code-tree x tree)
                    (make-code-tree tree x)))
            ((< (weight x) (weight tree)) (make-code-tree   (adjoin-tree x (left-branch tree))
                                                            (right-branch tree)))
            ((else (make-code-tree   (adjoin-tree x (right-branch tree)
                                                    (left-branch tree)))))))

(define (successive-merge set)
    (define (iter set tree)
        (if (null? set) tree
                        (let ((x (car set)))
                            (iter (cdr set) (adjouin-tree x tree)))))
    (iter (cddr set) (make-code-tree (car set) (cadr set))))

(define (generate-huffman-tree pairs)
    (successive-merge (make-leaf-set pairs)))