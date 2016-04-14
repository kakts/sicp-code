;p161 make-wire
;Implementation of digital circuits
;半加算器回路の実装

(define a (make-wire))
(define b (make-wire))
(define c (make-wire))
(define d (make-wire))
(define e (make-wire))
(define s (make-wire))



;半加算器に接続する４本の外部の回線に対し、この回路を構成する手続きharl-adderを定義
(define (half-adder a b s c)
  (let ((d (make-wire)) (e (make-wire)))
    ;OR回路に接続
    (or-gate a b d)

    ;and回路に接続
    (and-gate a b c)

    ;inverter回路に接続
    (inverter c e)

    ;and回路に接続
    (and-gate d e s)
  )
)

;全加算器を構成する手続き定義
(define (full-adder a b c-in sum c-out)
  (let ((s (make-wire))
        (c1 (make-wire))
        (c2 (make-wire)))
    (half-adder b c-in s c1)
    (half-adder a s sum c2)
    (or-gate c1 c2 c-out)
  )
)

;指定した回線の信号の現在の値を返す
(define (get-signal wire)
  (wire 'get-signal)
)

;指定した回線の信号の値を新しい値に変更する
(define (set-signal! wire new-value)
  ((wire 'set-signal!) new-value)
)

;回線の信号が値を変えた時、指定した手続きが走るように設定する
(define (add-action! wire action-procedure)
  ((wire 'add-action!) action-procedure)
)

;inverter回路
(define (inverter input output)
  ;指定した入力値を反転する
  (define (invert-input)
    (let ((new-value (logical-not (get-signal input))))
      (after-delay inverter-delay
        (lambda ()
          (set-signal! output new-value)))))
  (add-action! input invert-input)
)

;否定回路
(define (logical-not s)
  (cond ((= s 0) 1)
        ((= s 1) 0)
  (else (error "Invalid signal" s)))
)

;and回路
(define (and-gate a1 a2 output)
  (define (and-action-procedure)
    (let ((new-value
          (logical-and (get-signal a1) (get-signal a2))))
        (after-delay and-gate-delay
          (lambda ()
            (set-signal! output new-value)
          )
        )
    )
  )
  (add-action! a1 and-action-procedure)
  (add-action! a2 and-action-procedure)
  'ok
)
