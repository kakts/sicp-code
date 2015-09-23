;p132 一様乱数を返す

;TODO rand-update

(define rand
  (let ((x 9))
    (lambda ()
      (set! x (rand-update x))
      x
    )
  )
)

;任意の２つの整数を選んだときにgcdが1となる確率が 6 / pi　となる事実を用いて
;piの値を推定する
(define (estimate-pi trials)
  (sqrt
    (/
      6
      (monte-carlo trials cesaro-test)
    )
  )
)

;ランダムに選んだ２つの整数のgcdが１か判定する
(define (cesaro-test)
  (=
    (gcd
      (rand)
      (rand)
    )
    1
  )
)

;モンテカルロ法をつかって値の近似値を求める
;指定された回数だけ実験を行い、実験が真となった割合を返す
(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond
      ; 残り回数が０のときは成功割合を求める
      ((= trials-remaining 0)
        (/ trials-passed trials)
      )
      ((experiment)
        (iter (- trials-remaining 1) (+ trials-passed 1))
      )
      (else
        (iter (- trials-remaining 1) trials-passed)
      )

    )
  )
  (iter trials 0)
)

(print (estimate-pi 100))
