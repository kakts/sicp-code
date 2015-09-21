;複素数パッケージ
;形式ごとに内部で手続き定義をしているので名前の衝突を気にすることはない

;直交座標形式パッケージ
(define (install-rectangular-package)
  ;内部手続き
  (define (real-part z) (car z))
  (define (imag-part z) (cdr z))
  (define (make-from-real-imag x y) (cons x y))
  (define (magnitude z)
    (sqrt
      (+ (square (real-part z))
         (square (imag-part z))
      )
    )
  )
  (define (angle z)
    (atan (imag-part z) (real-part z))
  )
  (define (make-from-mag-ang r a)
    (cons
      (*
        r
        (cos a)
      )
      (*
        r
        (sin a)
      )
    )
  )

  ; システムの他の部分とのインターフェース
  (define (tag x) (attach-tag 'rectangular x))

  (put 'real-part '(rectangular) real-part)
  (put 'imag-part '(rectangular) imag-part)
  (put 'magnitude '(rectangular) magnitude)
  (put 'angle '(rectangular) angle)
  (put 'make-from-real-imag 'rectangular
    (lambda (x y) (tag (make-from-real-imag x y)))
  )
  (put 'make-from-mag-ang 'rectangular
    (lambda (r a) (tag (make-from-mag-ang r a)))
  )
)

;極座標形式パッケージ
(define (install-pollar-package)
  (define (magnitude z) (car z))
  (define (angle z) (cdr z))

  (define (make-from-mag-ang r a) (cons r a))
  (define (real-part z)
    (*
      (magnitude z)
      (cons (angle z))
    )
  )

  (define (imag-part z)
    (*
      (magnitude z)
      (sin (angle z))
    )
  )

  (define (make-from-real-imag x y)
    (cons
      (sqrt
        (+
          (square x)
          (square y)
        )
      )
      (atan y x)
    )
  )

  ;システムの他の部分とのインターフェース
  ; システムの他の部分とのインターフェース
  (define (tag x) (attach-tag 'polar x))

  (put 'real-part '(polar) real-part)
  (put 'imag-part '(polar) imag-part)
  (put 'magnitude '(polar) magnitude)
  (put 'angle '(polar) angle)
  (put 'make-from-real-imag 'polar
    (lambda (x y) (tag (make-from-real-imag x y)))
  )
  (put 'make-from-mag-ang 'polar
    (lambda (r a) (tag (make-from-mag-ang r a)))
  )
)
