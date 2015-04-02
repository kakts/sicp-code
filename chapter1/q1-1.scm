(print (+ 5 3 4))


(define a 3)

(define b (+ a 1))

; a = 3 , b = 4
(print (+ a b (* a b)))

; #f
(print (= a b))

; true
(print (= a a))

 
(print (if (and (> b a) (< b (* a b)))
  b a))

;conditional return 16
(print (cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25)) )

; return 6
(print (+ 2 (if (> b a) b a)))

; b * (3 + 1) = 16
(print (* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))
)

