; item が　xに含まれているかどうかチェックする
(define (memq item x)
  (cond
    ((null? x) false)
    ((eq? item (car x)) x)
    (else (memq item (cdr x)))
  )
)

; false
(print (memq 3 '(1 4 5)))

(print (memq 'apple '(pear banana apple)))
