(define (render rownum colnum)
    (cond
        ((= rownum 1) (print 1))
        ((= colnum 1) (print 1))
        ((= colnum rownum) (print 1))
        (else 
            (print
                (+ 
                    (pas-tri (- rownum 1) (- colnum 1))
                    (pas-tri (- rownum 1) colnum))
            )
        )
    )
)


(render 3 2)
