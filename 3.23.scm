(define (make-deque)
    (cons '() '()))

(define (front-deque dq)
    (car dq))

(define (set-front-deque! dq new-front)
    (set-car! dq new-front))

(define (rear-deque dq)
    (cdr dq))

(define (set-rear-deque! dq new-rear)
    (set-cdr! dq new-rear))

(define (empty-deque? dq)
    (or    (null?  (front-deque dq))
            (null?  (rear-deque dq))))

(define (next-item item)
    (caddr item))

(define (set-next-item! item next)
    (set-car! (cddr item) next))

(define (prev-item item)
    (cadr item))

(define (set-prev-item! item prev)
    (set-car! (cdr item) prev))

(define (front-insert-deque! dq item)
    (let ((new-pair (list item '() '())))
        (if (empty-deque? dq)
            (set-rear-deque! dq new-pair)
            (set-cdr! (front-deque dq) new-pair))
        (set-next-item! new-pair (front-deque dq))
        (set-front-deque! dq new-pair)))

(define (rear-insert-deque! dq item)
    (let ((new-pair (list item () '())))
        (if (empty-deque? dq)
            (set-front-deque! dq new-pair)
            (set-cdr! (rear-deque dq) new-pair))
        (set-prev-item! new-pair (rear-deque dq))
        (set-rear-deque! dq new-pair)))

(define (front-delete-deque! dq)
    (if (empty-deque? dq)
        (begin  (set-rear-deque! dq '())
                (set-front-deque! dq '())
                (error "DELETE - front delete from empty deque"))
        (begin 
            (set-front-deque! dq (cdr (front-deque dq)))
            (if (not (empty-deque? dq))
                (set-prev-item! (front-item dq) '())))))
    

(define (rear-delete-deque! dq)
    (if (empty-deque? dq)
        (begin  (set-rear-deque! dq '())
                (set-front-deque! dq '())
                (error "DELETE - rear delete from empty deque"))
        (begin 
            (set-rear-deque! dq (prev-item (rear-deque dq)))
            (if (not (empty-deque? dq))
                (set-next-item! (next-item dq) '())))))

(define dq (make-deque))
(front-insert-deque! dq 'a)
(rear-insert-deque! dq 'z)
(car (front-deque dq))
(car (rear-deque dq))
(rear-delete-deque! dq)
(car (front-deque dq))