; listの最後の項を取得
(define (last-pair list)
  ; listの次の項がnullの場合は先頭の項を返す
  (if (null? (cdr list))
    (car list)
    (last-pair (cdr list))
  )
)

(define test (list 1 2 3 4 5))

(print (last-pair test))
