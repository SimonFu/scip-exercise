; Recursive
(define (cont-frac n d k)
    (define (iter index)
        (let ((nv (n index))
              (dv (d index)))
            (if (= index k) (/ nv dv)
                            (/ nv
                               (+ dv (iter (+ index 1)))))))

    (iter 1))