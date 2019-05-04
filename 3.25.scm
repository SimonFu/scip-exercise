(define (make-table)
    (list '*table*))

(define (assoc key records)
        (cond   ((null? records) false)
                ((and (pair? (car records)) (equal? key (caar records))) (car records))
                ((and (not (pair? (car records))) (equal? key (car records))) records)
                (else (assoc key (cdr records)))))

(define (lookup keys table)
    (cond   ((null? table) false) 
            ((null? keys) (if   (or (null? table) (pair? (cdr table)))
                                false
                                (cdr table)))
            (else
                (let ((subtable (assoc (car keys) (cdr table))))
                    (if subtable
                        (lookup subtable (cdr keys))
                        false)))))

(define (insert! keys value table)
    (let (  (subtable (assoc (car keys) (cdr table)))
            (key (car keys)))
        (if subtable
            (if (null? (cdr keys))
                (set-cdr! subtable (cons (cons key value) (cdr subtable))
                (insert! (cdr keys) value subtable)))            
            (if (null? (cdr keys))
                (set-cdr! table (cons (cons key value) (cdr table)))
                (begin  (set-cdr!    table
                                    (cons (list key) (cdr table)))
                        (insert! (cdr keys) value (cadr table)))))))


(define table (make-table))
(insert! (list 'a) 10 table)
(display table)
(lookup (list 'a) table)
(cdr table)