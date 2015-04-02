(define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))
    )
)

(print (gcd 206 40))
