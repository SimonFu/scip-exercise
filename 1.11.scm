; Recursive process
;(define (f n)
;    (if (< n 3)
;        n
;        (+ (f (- n 1))
;           (* 2 (f (- n 2)))
;           (* 3 (f (- n 3))))))

; Iterative process
(define (f n)
    (define (f_iter a b c counter)
        (if (= counter 0) 
            a
            (f_iter b 
                    c
                    (+ c
                       (* 2 b)
                       (* 3 a))
                    (- counter 1))))
    
    (f_iter 0 1 2 n))

(f 0)
(f 1)
(f 2)
(f 3)
(f 3000)