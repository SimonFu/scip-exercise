(load "2.7.scm")
(load "utilities/average.scm")

(define (make-center-percent c p)
    (make-interval  (* c (- 1.0 (/ p 100.0)))
                    (* c (+ 1.0 (/ p 100.0)))))

(define (center i)
    (/ (+ (lower-bound i)
          (upper-bound i))
       2))

(define (percent i)
    (*  (/  (/  (- (upper-bound i) (lower-bound i))
                (average (upper-bound i) (lower-bound i)))
            2)
        100)