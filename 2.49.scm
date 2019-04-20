(load "2.47.scm")
(load "2.46.scm")
(define (outline-painter frame)
    (let (  (p1 (origin-frame frame))
            (p2 (add-vect   (origin-frame frame)
                            (edge1-frame frame)))
            (p3 (add-vect   (origin-frame frame)
                            (add-vect   (edge2-frame frame)
                                        (edge1-frame frame))))
            (p4 (add-vect   (origin-frame frame)
                            (edge2-frame frame))))
        ((segments->painter (list   (make-segment p1 p2)
                                    (make-segment p2 p3)
                                    (make-segment p3 p4)
                                    (make-segment p4 p1)))(frame)))

(define (x-painter frame)
    (let (  (p1 (origin-frame frame))
            (p2 (add-vect   (origin-frame frame)
                            (edge1-frame frame)))
            (p3 (add-vect   (origin-frame frame)
                            (add-vect   (edge2-frame frame)
                                        (edge1-frame frame))))
            (p4 (add-vect   (origin-frame frame)
                            (edge2-frame frame)))))
        ((segments->painter (list   (make-segment p1 p3)
                                    (make-segment p2 p4)))(frame)))

(define (diamond-painter frame)
    (let (  (p1 (add-vect   (origin-frame frame)
                            (scale-vect     (edge1-frame frame)
                                            0.5)))
            (p2 (add-vect   (origin-frame frame)
                            (add-vect   (scale-vect     (edge2-frame frame)
                                                        0.5)
                                        (edge1-frame frame))))
            (p3 (add-vect   (origin-frame frame)
                            (add-vect   (scale-vect     (edge1-frame frame)
                                                        0.5)
                                        (edge2-frame frame))))
            (p4 (add-vect   (origin-frame frame)
                            (scale-vect     (edge2-frame frame)
                                            0.5))))
        ((segments->painter (list   (make-segment p1 p2)
                                    (make-segment p2 p3)
                                    (make-segment p3 p4)
                                    (make-segment p4 p1)))(frame))))