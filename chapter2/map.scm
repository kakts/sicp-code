(define (map proc items)
  (if (null? items)
    items
    (cons (proc (car items))
      (map proc (cdr items))
    )
  )
)

(print (map abs (list -10 2.5 -11.6 17)))
