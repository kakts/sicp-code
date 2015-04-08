(define (average-damp f)
    (lambda (x) (average x (f x)))
)

(define (average a b)
    (/ (+ a b) 2)
)

(define (square x)
    (* x x)
)

(print ((average-damp square) 10))
