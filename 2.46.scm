(define (make-vect x y)
    (cons x y))

(define (xcor-vect v)
    (car v))

(define (ycor-vect v)
    (cdr v))

(define (add-vect v1 v2)
    (make-vect  (+  (xcor-vect v1)
                    (xcor-vect v2))
                (+  (Ycor-vect v1)
                    (Ycor-vect v2))))

(define (SUB-vect v1 v2)
    (make-vect  (-  (xcor-vect v1)
                    (xcor-vect v2))
                (-  (Ycor-vect v1)
                    (Ycor-vect v2))))

(define (scale-vect v s)
    (make-vect  (*  (xcor-vect v)
                    s)
                (*  (Ycor-vect v)
                    s)))