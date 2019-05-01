(define (list-cycle? x)
    (define (iter one-step two-step)
        (cond   ((or (null? one-step) (null? two-step)) false)
                ((eq? one-step two-step) true)
                ((null? (cdr two-step)) false)
                (else (iter (cdr one-step) (cddr two-step)))))
    (iter x (cdr x)))

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