;p129
;銀行口座からお金を払い出す状況をモデル化する
;withdraw-1.scmで用いたbalanceをグローバル変数として使わず、
;withdraw関数からのみ間接的にアクセスできるようにする

;払い出し器を作り出す　引数balanceは口座の初期値
(define (make-withdraw balance)
  (lambda (amount)
    (if (>= balance amount)
      (begin
        (set! balance (- balance amount))
        balance
      )
      "Insufficient funds."
    )
  )
)

;次のように２つのオブジェクトを作り出せる
;それぞれのオブジェクトはそれぞれ独立した情報を持つ
(define W1 (make-withdraw 100))
(define W2 (make-withdraw 100))

(print (W1 50))
(print (W2 70))
(print (W2 40))
