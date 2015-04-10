;redefining cons car cdr p51

(define (cons x y)
    (define (dispatch m)
        (cond ((= m 0) x)
              ((= m 1) y)
              (else (error "Argument not 0 or 1 -- CONS" m))
        )
    )
    dispatch
)

(define (car z) (z 0))

(define (cdr z) (z 1))

(print ((cons 1 3) 1))
;(print ((cons 1 3) 4))


(print 
    (car
        (cons 1 4)
    )
)
