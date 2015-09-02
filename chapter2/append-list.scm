;append two lists.
(define (append list1 list2)
  (if (null? list1)
    list2
    (cons (car list1) (append (cdr list1) list2))
    ;list1の先頭以外とlist2をappendし、その結果にlist1の先頭を追加する
  )
)

(define odds (list 1 3 5 7))
(define squares (list 1 4 9 16 25))

(print (append odds squares))

(print (append squares odds))
