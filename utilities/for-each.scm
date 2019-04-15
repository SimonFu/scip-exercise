(define (for-each proc items)
   (if (not (null? items))
        ((lambda x 
                (proc   (car items))
                        (for-each proc (cdr items))) ())))