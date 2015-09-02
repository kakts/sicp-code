(define one-through-four (list 1 2 3 4))

(print one-through-four)

;リスト先頭の値表示
(print (car one-through-four))
;リスト先頭以外の値表示
(print (cdr one-through-four))

(print (car (cdr one-through-four)))

(print (cons 10 one-through-four))
