(load "bin-tree.scm")
(define (tree->list-1 tree)
    (if (null? tree)    '()
                        (append (tree->list-1 (left-branch tree))
                                (cons   (entry tree)
                                        (tree->list-1 (right-branch tree))))))

(define t (make-tree 7 '() '()))
(define t (adjoin-set 3 t)) 
(define t (adjoin-set 9 t))
(define t (adjoin-set 11 t))
(define t (adjoin-set 1 t))
(define t (adjoin-set 5 t))

(display t)
(tree->list-1 t)

(define (tree->list-2 tree)
    (define (copy-to-list tree result-list)
        (if (null? tree)    result-list
                            (copy-to-list    (left-branch tree)
                                            (cons   (entry tree)
                                                    (copy-to-list    (right-branch tree)
                                                                    result-list)))))
    (copy-to-list tree '()))

(tree->list-2 t)