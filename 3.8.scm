(define f
    (let ((val -1))
        (lambda (x)
            (if (= val -1)
                (begin (set! val x) val)
                0))))

(+ (f 0) (f 1))