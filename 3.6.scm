(define rand
    (let ((state 0))
        (lambda (x)
            (cond   ((eq? x 'generate) (begin (set! state (rand-update state)) state))
                    ((eq? x 'reset) 
                        (lambda (new-val)
                            (set! state new-val)))))))

(define (rand-update x)
    (+ x 1))
(rand 'generate)
(rand 'generate)
(rand 'generate)
(rand 'generate)