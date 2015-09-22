;銀行口座からお金を払い出す状況をモデル化する

;口座残高初期値
;balanceはグローバル変数なのでどこからでもアクセスできてしまう。
(define balance 100)

(define (withdraw amount)
  (if (>= balance amount)
    (begin
      ;amountを引いた額を新たにbalanceにセットし直す
      (set! balance (- balance amount))
      balance
    )
    "Insufficient funds." ;残高が足りない
  )
)

(print (withdraw 30))
