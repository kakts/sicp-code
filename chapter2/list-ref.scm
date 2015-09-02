;
(define (list-ref items n)
  (if (= n 0)
    (car items)
    (list-ref (cdr items) (- n 1))
  )
)

(define squares (list 1 4 9 16 25))


(print (list-ref squares 3))

; listの長さを取得
(define (length items)
  (if (null? items)
    0
    (+ 1 (length (cdr items)))
  )
)

(define odds (list 1 3 5 7))

(print (length odds))
