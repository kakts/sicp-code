(define (smallest-divisor n)
    (find-divisor n 2)
)

(define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))
    )
)

(define (divides? a b)
    (= (remainder b a) 0))

(define (square n)
    (* n n)
)

(print (smallest-divisor 11))

(define (prime? n)
    (= n (smallest-divisor n))
)

(print 199)
(print (smallest-divisor 199))
(print 1999)
(print (smallest-divisor 1999))
(print 19999)
(print (smallest-divisor 19999))
