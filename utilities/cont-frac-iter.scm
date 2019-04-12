; Interative process
(define (cont-frac n d k)
    (define (iter index value)
        (let ((nv (n index))
              (dv (d index)))
            (if (= index 0) value
                            (iter (- index 1) 
                                  (/ nv 
                                     (+ dv value))))))

    (iter k 0.0))