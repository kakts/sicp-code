(define (+ a b)
    (if (= a 0)
        b
        (inc (+ (dec a) b))
    )
)
(print (+ 4 5))
