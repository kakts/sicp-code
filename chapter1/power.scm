; this function needs O(n)-steps and O(n)-spaces
(define (power x n)
    (if (= n 0)
        1    
        (* x (power x (- n 1)))
    )
)

(print (power 2 3))

; this function needs 0(n)-steps and 0(1)-space
(define (linear-power x n)
    (iter x n 1)
)

(define (iter b counter product)
    (if (= counter 0)
        product
        (iter b
              (- counter 1)
              (* b product)
        )
    )
)

(print (linear-power 2 3))
