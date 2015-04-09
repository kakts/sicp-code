(define x  (cons 1 2))
(print (car x))
(print (cdr x))

(define y (cons 3 4))
(define z (cons x y))

(print (car (car z)))
(print (car (cdr z)))
