(load "utilities/segment.scm")

(define seg (make-segment (make-point 0 0) (make-point 100 100)))
(midpoint-segment seg)