;複素数を扱う
; 直交座標形式と極座標形式を演算に酔って使い分ける

; 加算
(define (add-complex z1 z2)
  ; 実部と虚部　それぞれ別に加算する
  (make-from-real-imag
    (+ (real-part z1) (real-part z2))
    (+ (imag-part z1) (imag-part z2))
  )
)

; 減算
(define (sub-complex z1 z2)
  (make-from-real-imag
    (- (real-part z1) (real-part z2))
    (- (imag-part z1) (imag-part z2))
  )
)

; 乗算
(define (mul-complex z1 z2)
  (make-from-mag-ang
    (* (magnitude z1) (magnitude z2))
    (+ (angle z1) (angle z2))
  )
)

; 除算
(define (div-complex z1 z2)
  (make-from-mag-ang
    (/ (magnitude z1) (magnitude z2))
    (- (angle z1) (angle z2))
  )
)

; 実部を取得
(define (real-part z) (car z))

; 虚部
(define (imag-part z) (cdr z))

(define (magnitude z)
  (sqrt
    (+
      (square (real-part z))
      (square (imag-part z))
    )
  )
)

(define (angle z)
  (atan (imag-part z) (realpart z))
)

(define (make-from-real-imag x y)
  (cons x y)
)

(define (make-from-mag-ang r a)
  （cons (* r (cos a)) (* r (sin a))
)
