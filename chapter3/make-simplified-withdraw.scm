;p134

;お金不足チェックを行わない簡易版
(define (make-simplified-withdraw balance)
  (lambda (amount)
    (set!
      balance
      (- balance amount)
    )
    balance
  )
)

(define W (make-simplified-withdraw 25))

(print (W 20))
(print (W 10))

(define (make-decrementer balance)
  (lambda (amount)
    (- balance amount)
  )
)

(define D (make-decrementer 25))

;make-simplified-withdrawと違って連続して呼び出しても積算効果はない
(print (D 20))
(print (D 10))


(print ((make-decrementer 25) 20))

(print ((make-simplified-withdraw 25) 20))
