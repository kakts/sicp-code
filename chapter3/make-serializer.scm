;p180 make serializer

(define x 10)

(define s (make-serializer))

; define parallel execute function
; mock
(define parallel-execute hoge)

(parallel-execute
  (s (lambda () (set! x (* x x))))
  (s (lambda () (set! x (+ x 1))))
)

(define (make-account balance)
  (define (withdraw amount)
    (if (>= balance amount)
      (begin (set! balance (- balance amount)) balance)
      "Insufficient funds"
    )
  )

  (define (deposit amount)
    (set! balance (+ balance amount))
    balance
  )

  (let ((protected (make-serializer)))
    (define (dispatch m)
      (cond
        ((eq? m 'withdraw) (protected withdraw))
        ((eq? m 'deposit) (protected deposit))
        ((eq? m 'balance) balance)
        (else (error "Unknown request -- MAKE-ACCOUNT" m))
      )
    )
    dispatch
  )
)
