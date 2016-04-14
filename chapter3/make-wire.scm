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
