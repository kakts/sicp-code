;p130
;払い出し、預け入れができるオブジェクト
(define (make-account balance)
  (define (withdraw amount)
    (if (>= balance amount)
      (begin
        (set!
          balance
          (- balance amount)
        )
      )
      "Insufficient funds."
    )
  )

  (define (deposit amount)
    (set!
      balance
      (+ balance amount)
    )
    balance
  )

  (define (dispatch m)
    (cond
      ((eq? m 'withdraw) withdraw)
      ((eq? m 'deposit) deposit)
      (else (error "Unknown request -- MAKE-ACCOUNT" m))
    )
  )
  dispatch
)

(define acc (make-account 100))

(print ((acc 'withdraw) 50))
(print ((acc 'withdraw) 60))
(print ((acc 'deposit) 40))
(print ((acc 'withdraw) 60))
