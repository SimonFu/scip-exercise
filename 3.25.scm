(define (make-table)
    (list '*table*))

(define (assoc key records)
    (cond   ((null? records) false)
            ((equal? key (caaar records)) (car records))
            (else (assoc key (cdr records)))))

(define (lookup keys table)
    (let (  (subtable (assoc (car keys) (cdr table)))
            (key (car keys)))
        (if subtable
            (if (null? (cdr keys)) 
                (cdr (car subtable))
                (lookup (cdr keys) subtable))
            false)))

(define (insert! keys value table)
    (let (  (subtable (assoc (car keys) (cdr table)))
            (key (car keys)))
        (if subtable
            (if (null? (cdr keys)) 
                (set-cdr!   (car subtable) 
                            value)
                (insert! (cdr keys) value subtable))
            (if (null? (cdr keys))
                (set-cdr!   table 
                            (cons   (list (cons key value)) 
                                    (cdr table)))
                (begin  (set-cdr!    table
                                    (cons (list (cons key '())) (cdr table)))
                        (insert! (cdr keys) value (cadr table)))))))


(define table (make-table))
(insert! (list 'a) 10 table)
(insert! (list 'b) 20 table)
(insert! (list 'a 'aa) 11 table)
(insert! (list 'a) 100 table)
(insert! (list 'a 'c 'd) 1234 table)
(display table)
(lookup (list 'a) table)
(lookup (list 'a 'aa) table)
(lookup (list 'a 'c 'd) table)
(lookup (list 'a 'b 'd) table)
