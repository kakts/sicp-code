; listの各要素に同様の処理を適用させた結果を返す
(define (scale-list items factor)
  (if (null? items)
    items
    (cons (* (car items) factor)
      (scale-list (cdr items) factor)
    )
  )
)

(print(scale-list (list 1 2 3 4 5) 10))
