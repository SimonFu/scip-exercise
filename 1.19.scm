;a<-bq+aq+ap
;b<-bp+aq

;a<-(bp+aq)q+(bp+aq+ap)q+(bp+aq+ap)p
;a<-b(q^2+2pq)+q(q^2+2pq)+a(p^2+q^2)

;b<-(bp+aq)p+(bp+aq+ap)q
;b<-b(p^2+q^2)+a(q^2+2pq)

;p' = p^2+q^2
;q' = q^2+2pq

(define (fib n)
    (define (fib_iter a b p q count)
        (cond ((= count 0) b)
              ((even? count)
                (fib_iter a 
                          b
                          (+ (square p) (square q))
                          (+ (square q) (* 2 p q))
                          (/ count 2)))
              (else (fib_iter (+ (* b q) (* a q) (* a p))
                              (+ (* b p) (* a q))
                              p
                              q
                              (- count 1)))))
                              
    (fib_iter 1 0 0 1 n))

(fib 0)
(fib 1)
(fib 2)
(fib 3)
(fib 4)
(fib 5)
(fib 6)
(fib 5000)