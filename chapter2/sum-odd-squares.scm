;引数として木をとり、奇数である葉の二乗の和を計算する
(define (sum-odd-squares tree)
  (cond ((null? tree) 0)
        ((not (pair? tree)) ; 葉の場合
          (if (odd? tree)
            (square tree)
            0
          )
        )
        (else (+ (sum-odd-squares (car tree))
          (sum-odd-squares (cdr tree))
        ))

  )
)

()
