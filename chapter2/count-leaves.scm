; ((1 2) 3 4)
(define x (cons (list 1 2) (list 3 4)))

; 3
(print (length x))

; 子ノードの要素数も含めた数を返したい
(define (count-leaves x)
  (cond ((null? x) 0)
         ((not (pair? x)) 1)
         (else (+ (count-leaves (car x))
                  (count-leaves (cdr x)))
         ))
)

(print (count-leaves x))
