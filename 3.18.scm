(define (list-cycle? x)
    (let ((counted-pairs '()))
        (define (has-counted x)
            (define (iter counted)
                (if (null? counted)
                    false
                    (or    (eq? (car counted) x)
                            (iter (cdr counted)))))
            (iter counted-pairs))
        (define (iter x)
            (cond ((null? x) false) 
                ((has-counted x) true)
                (else   (begin  (set! counted-pairs (cons x counted-pairs)) 
                                (iter (cdr x))))))
        (iter x)))

(define (final-pair x)
        (if (null? (cdr x))
            x
            (final-pair (cdr x))))
(define (make-cycle x)
    (set-cdr!   (last-pair x) x)
                x)

(define z (make-cycle (list 'a 'b 'c)))

(define y (list 'a 'b 'c))

(list-cycle? z)
(list-cycle? y)