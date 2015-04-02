(define (set s t) (
  if (> s t)
    s
    t
  
  )
)
(define (square x) (* x x))

(define 
  (get a b c)
    (

      + (square (set a b)) (square (set b c))
    )
)

;３つの数を引数としてとり、大きい２つの数の二乗の和を返す
(print (get 5 3 4))

