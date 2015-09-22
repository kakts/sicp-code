;銀行口座からお金を払い出す状況をモデル化する
;withdraw-1.scmで用いたbalanceをグローバル変数として使わず、
;withdraw関数からのみ間接的にアクセスできるようにする

;内部変数としてbalanceをもっているのでグローバルにbalanceにアクセスできない
(define new-withdraw
  (let ((balance 100))
    (lambda (amount)
      (if (>= balance amount)
        (begin
          (set!
            balance
            (- balance amount)
          )
          balance
        )
        "Insufficient funds."
      )
    )
  )
)

(print (new-withdraw 100))
