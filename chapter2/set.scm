;順序づけられないリストとしての集合 p89

; xがset集合の要素か判定する
(define (element-of-set? x set)
  (cond ((null? set) false))
        ((equal? x (car set) true))
        (else (element-of-set? x (cdr set))
  )
)

;引数としてオブジェクトと集合をとり、元の集合の要素と追加する要素を含む集合を返す
(define (adjoin-set x set)
  (if (element-of-set? x set)
    set
    (cons x set)
  )
)

; ２つの集合の積集合を求める
(define (intersection-set set1 set2)
  (cond
    ((or (null? set1) (null? set2)) '()) ; どちらかがnullならば空集合
    ((element-of-set? (car set1) set2)
      (cons (car set1)
            (intersection-set (cdr set1) set2)))

    (else (intersection-set (cdr set1) set2))
  )
)
