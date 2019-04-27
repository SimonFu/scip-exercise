(load "code-tree.scm")
(load "2.60.scm")

(define (encode-symbol symbol tree)
    (define (iter tree)
        (cond   ((and (leaf? tree) (eq? (symbol-leaf tree) symbol)) '())
                ((element-of-set? symbol (symbols (left-branch tree))) 
                    (cons   '0 
                            (iter (left-branch tree))))
                ((element-of-set? symbol (symbols (right-branch tree))) 
                    (cons   '1
                            (iter (right-branch tree))))
                (else (error "Wrong symbol"))))
    (iter tree))

(define (encode message tree)
    (if (null? message)
        '()
        (append (encode-symbol (car message) tree)
                (encode (cdr message) tree))))

(define tree 
    (make-code-tree (make-leaf 'A 4)
                    (make-code-tree
                        (make-leaf 'B 2)
                        (make-code-tree
                            (make-leaf 'D 1)
                            (make-leaf 'C 1)))))

(define message '(A D A B B C A))
(encode message tree)
