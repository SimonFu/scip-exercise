(define (make-table same-key?)
    (define (assoc key records)
        (cond   ((null? records) false)
                ((same-key? key (caar records)) (car records))
                (else (assoc key (cdr records)))))
    (let ((local-table (list '*table*)))
        (define (lookup key-1 key-2)
            (let ((subtable (assoc key-1 (cdr local-table))))
                (if subtable
                    (let ((record (assoc key-2 (cdr subtable))))
                        (if record
                            (cdr record)
                            false))
                    (error "not found subtable"))))
        (define (insert! key-1 key-2 value)
            (let ((subtable (assoc key-1 (cdr local-table))))
                (if subtable
                    (let ((record (assoc key-1 (cdr subtable))))
                        (if record
                            (set-cdr!   record
                                        value)
                            (set-cdr!   record
                                        (cons   (cons key-2 value)
                                                (cdr record)))))
                    (set-cdr!   local-table
                                (cons   (list key-1 (cons key-2 value))
                                        (cdr local-table))))))
        (define (dispatch m)
            (cond   ((eq? m 'lookup) lookup)
                    ((eq? m 'insert!) insert!)
                    (error "Unknown operation: TABLE" m)))
        
        dispatch))

    (define t (make-table equal?))
    ((t 'insert!) 'simon 'math 100)
    ((t 'insert!) 'simon 'english 98)
    ((t 'insert!) 'mike 'computer 98)
    ((t 'lookup) 'simon 'computer)