(define (same-parity n . args)
  (if (null? args)
    args
    (if (check-parity n (car args))
      (append (list n) (same-parity n (cdr args)))
    )
  )
)

(define (check-parity a b)
  (= (remainder a 2) (remainder b 2))
)
(print (remainder 3 2))
(print (check-parity 2 3))
(print (check-parity 2 4))
(print (same-parity 4 1))
