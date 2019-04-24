(define (entry tree)
    (car tree))

(define (left-branch tree)
    (cadr tree))

(define (right-branch tree)
    (caddr tree))

(define (make-tree entry left right)
    (list entry left right))

(define (element-of-set? x set)
    (cond   ((null? set) false)
            ((< x (entry set)) (element-of-set? x (left-branch set)))
            ((> x (entry set)) (element-of-set? x (right-branch set)))
            (else true)))

(define (adjoin-set x set)
    (cond   ((null? set) (make-tree x '() '()))
            ((= x (entry set)) set)
            ((< x (entry set)) (make-tree (entry set)
                                        (adjoin-set x (left-branch set))
                                        (right-branch set)))
            (else   (make-tree  (entry set)
                                (left-branch set)
                                (adjoin-set x (right-branch set))))))

;(define t (make-tree 7 '() '()))
;(define t (adjoin-set 3 t)) 
;(define t (adjoin-set 9 t))
;(define t (adjoin-set 11 t))
;(define t (adjoin-set 1 t))
;(define t (adjoin-set 5 t))

;(display t)