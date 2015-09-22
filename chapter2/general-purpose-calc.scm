;汎用算術演算
;add sum mul divを定義し、引数の型(実数、有理数、複素数)にあわせた演算を行う

(define (add x y)
  (apply-generic 'add x y)
)

(define (sub x y)
  (apply-generic 'sub x y)
)

(define (mul x y)
  (apply-generic 'mul x y)
)

(define (div x y)
  (apply-generic 'div x y)
)

;汎用演算を引数に作用させる
(define (apply-generic op arg)
  (arg op)
)


(define (install-scheme-number-package)
  (define (tag x)
    (attach-tag 'scheme-number x)
  )

  (put 'add '(scheme-number scheme-number)
    (lambda (x y) (tag (+ x y)))
  )

  (put 'sub '(scheme-number scheme-number)
    (lambda (x y) (tag (- x y)))
  )

  (put 'mul '(scheme-number scheme-number)
    (lambda (x y) (tag (* x y)))
  )

  (put 'div '(scheme-number scheme-number)
    (lambda (x y) (tag (/ x y)))
  )

  (put 'make '(scheme-number scheme-number)
    (lambda (x y) (tag x))
  )

  'done
)

(define (make-scheme-number n)
  ((get 'make 'scheme-number) n)
)


;-------------------------------
;有理数算術演算を実行するパッケージ
(define (install-rational-package)
  ;;内部手続き
  (define (numer x) (car x))
  (define (denom x) (cdr x))
  (define (make-rat n d)
    (let ((g (gcd n d)))
      (cons (/ n g) (/ d g))
    )
  )

  (define (add-rat x y)
    (make-rat
      (+
        (* (numer x) (denom y))
        (* (numer y) (denom x))
      )
      (* (denom x) (denom y))
    )
  )

  (define (sub-rat x y)
    (make-rat
      (-
        (* (numer x) (denom y))
        (* (numer y) (denom x))
      )
      (* (denom x) (denom y))
    )
  )

  (define (mul-rat x y)
    (make-rat
      (* (numer x) (numer y))
      (* (denom x) (denom y))
    )
  )

  (define (div-rat x y)
    (make-rat
      (* (numer x) (denom y))
      (* (denom x) (numer y))
    )
  )


  ;; システムの他の部分へのインターフェース
  (define (tag x) (attach-tag 'rational x))
  (put 'add '(rational rational)
    (lambda (x y) (tag (add-rat x y)))
  )
  (put 'sub '(rational rational)
    (lambda (x y) (tag (sub-rat x y)))
  )
  (put 'mul '(rational rational)
    (lambda (x y) (tag (mul-rat x y)))
  )
  (put 'div '(rational rational)
    (lambda (x y) (tag (div-rat x y)))
  )
  (put 'make 'rational
    (lambda (n d) (tag (make-rat n d)))
  )

  (define (make-rational n d)
    ((get 'make 'rational) n d)
  )
)


;--------------------------------------------
;複素数関連パッケージ
(define (install-complex-package)
  (define (make-from-real-imag x y)
    ((get 'make-from-real-imag 'rectangular) x y)
  )
  (define (make-from-mag-ang r a)
    ((get 'make-from-mag-ang 'polar) r a)
  )

  ;内部手続き
  (define (add-complex z1 z2)
    (make-from-real-imag
      (+
        (real-part z1)
        (real-part z2)
      )
      (+
        (imag-part z1)
        (imag-part z2)
      )
    )
  )

  (define (sub-complex z1 z2)
    (make-from-real-imag
      (-
        (real-part z1)
        (real-part z2)
      )
      (-
        (imag-part z1)
        (imag-part z2)
      )
    )
  )

  (define (mul-complex z1 z2)
    (make-from-mag-ang
      (*
        (magnitude z1)
        (magnitude z2)
      )
      (+
        (angle z1)
        (angle z2)
      )
    )
  )

  (define (div-complex z1 z2)
    (make-from-mag-ang
      (/
        (magnitude z1)
        (magnitude z2)
      )
      (-
        (angle z1)
        (angle z2)
      )
    )
  )

  ;; システムの他の部分へのインターフェース
  (define (tag z) (attach-tag 'complex z))
  (put 'add '(complex complex)
    (lambda (x y) (tag (add-complex x y)))
  )
  (put 'sub '(complex complex)
    (lambda (x y) (tag (sub-complex x y)))
  )
  (put 'mul '(complex complex)
    (lambda (x y) (tag (mul-complex x y)))
  )
  (put 'div '(complex complex)
    (lambda (x y) (tag (div-complex x y)))
  )
  (put 'make-from-real-imag 'complex
    (lambda (x y) (tag (make-from-real-imag x y)))
  )
  (put 'make-from-mag-ang 'complex
    (lambda (r a) (tag (make-from-mag-ang r a)))
  )

)
