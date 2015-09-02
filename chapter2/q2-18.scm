;引数としてリストをとり逆順のリストを返す
(define (reverse items)
  (if (null? items)
    items
    (append (reverse (cdr items)) (list (car items)))
  )
)
(define test (list 1 2 3 4))
(print (reverse test))
