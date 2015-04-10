; 有理数 : 分子と分母の対として表現する
(define (make-rat n d)
    ;既約分数の形にするため、nとdの公約数を求めてconsに適用させる
    (let ((g (gcd n d)))

        (cons (/ n g) (/ d g))
    )
)

; x:1
(define (numer x)
    (car x)
)

; 1:x
(define (denom x)
    (cdr x)
)

; 有理数を 分子/分母　と印字する
(define (print-rat x)
    (newline)
    (display (numer x))
    (display "/")
    (display (denom x))
)

(define (add-rat x y)
    (make-rat 
        (+ 
            (* (numer x) (denom y))
            (* (numer y) (denom x))
        )
        (*
            (denom x) (denom y))
     )
)


; 2/3
(print (print-rat (make-rat 2 3)))
(print "b")
(define one-half (make-rat 1 2))
(print-rat one-half)
(print "c")
(define one-third (make-rat 1 3))
(print-rat (add-rat one-half one-third))

; 既約でない
(print-rat (add-rat one-third one-third))
