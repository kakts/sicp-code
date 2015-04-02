; recursive-style function
(define (rec-func n)
    (cond 
        ((< n 3) n)
        (+
            (rec-func (- n 1))
            (*
                2
                (rec-func (- n 2)))
            (*
                3
                (rec-func (- n 3)))
        )
    )
)

; linear-iterative function
(define (linear-func n)
    (iterate 1 1 n)
)

;(define (iterate value count max-count)
;    (cond 
;        ((> count max-count)
;            value )
;        ((< count 3)
;            (iterate count (+ count 1) max-count))
;        (else
;            ((iterate 
;                (+
;                    (linear-func (- count 1))
;                    (* 2 (linear-func (- count 2)))
;                    (* 3 (linear-func (- count 3)))
;                )
;                (+ count 1)
;                max-count
;            ))
;         )
;    )
;)
(define (f n)
    (iterate 2 1 0 n))

(define (iterate a b c count)
    (cond ((= count 0) c)
          (else (iterate (+ a (* 2 b) (* 3 c)) a b (- count 1)))
    )
)

    

(print (rec-func 1))
(print (rec-func 2))
(print (rec-func 3))
(print (rec-func 4))

(print (f 1))
(print (f 2))
(print (f 3))
(print (f 4))
