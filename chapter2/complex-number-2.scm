;虚数取得
; 座標形式と極座標形式のどちらも扱えるようにする

;形式タイプとデータからタグつきデータを作る
(define (attach-tag type-tag contents)
  (cons type-tag contetns)
)

;データから形式タイプを取り出す
(define (type-tag datum)
  (if (pair? datum)
    (car datum)
    (error "Bad tagged datum -- TYPE-TAG" datum)
  )
)

;データからコンテンツを取り出す
(define (contents datum)
  (if (pair? datum)
    (cdr datum)
    (error "Bad tagged datum -- CONTENTS" datum)
  )
)

; 直交座標形式かどうか判定する
(define (rectangular? z)
  ;形式タイプが rectangular
  (eq? (type-tag z) 'rectangular)
)

;極座標形式かどうか判定する
(define (polar? z)
  ;形式タイプが polar
  (eq? (type-tag z) 'polar)
)

;----------------------------------------
;直交座標系の虚数表現

;直交座標系に置ける実部取得
(define (real-part-rectangular z)
  (car z)
)

;直交座標系における虚部取得
(define (imag-part-rectangular z)
  (cdr z)
)



;直交座標系のデータから極座標系における絶対値r取得
(define (magnitude-rectangular z)
  (sqrt
    (+
      (square (real-part-rectangular z))
      (square (imag-part-rectangular z))
    )
  )
)

;直交座標系のデータから極座標系における角度A取得
(define (angle-rectangular z)
  (atan
    (imag-part-rectangular z)
    (real-part-rectangular z)
  )
)


(define (make-from-real-imag-rectangular x y)
  (attach-tag 'rectangular (cons x y))
)

(define (make-from-mag-ang-rectangular r a)
  (attach-tag 'rectangular
    (cons (* r (cos a)) (* r (sin a)))
  )
)

;----------------------------------------
;極座標系の虚数表現

;極座標系データから実部取得
(define (real-part-polar z)
  (*
    (magnitude-polar z)
    (cos (angle-polar z))
  )
)

;極座標系データから虚部取得
(define (imag-part-polar z)
  (*
    (magnitude-polar z)
    (sin (angle-polar z))
  )
)

(define (magnitude-polar z)
  (car z)
)

(define (angle-polar z)
  (cdr z)
)

(define (make-from-real-imag-polar x y)
  (attach-tag
    'polar
    (cons
      (sqrt
        (+ (square x) (square y))
        (atan y x)
      )
    )
  )
)

(define (make-from-mag-ang-polar r a)
  (attach-tag
    'polar
    (cons r a)
  )
)

;-----------------------------------------
;虚数表現　形式タイプに合わせた処理を行う

;実部取得
(define (real-part z)
  (cond
    ((rectangular? z)
      (real-part-rectangular (contents z))
    )
    ((polar? z)
      (real-part-polar (contents z))
    )
    (else
      (error "Unknown type -- REAL-PART" z)
    )
  )
)

;虚部取得
(define (imag-part z)
  (cond
    ((rectangular? z)
      (imag-part-rectangular (contents z))
    )
    ((polar? z)
      (imag-part-polar (contents z))
    )
    (else
      (error "Unknown type -- IMAG-PART" z)
    )
  )
)

;極座標形式における絶対値r 取得
(define (magnitude z)
  (cond
    ((rectangular? z)
      (magnitude-rectangular (contents z))
    )
    ((polar? z)
      (magnitude-polar (contents z))
    )
    (else
      (error "Unknown type -- MAGNITUDE" z)
    )
  )
)

;極座標形式における角度取得
(define (angle z)
  (cond
    ((rectangular? z)
      (angle-rectangular (contents z))
    )
    ((polar? z)
      (angle-polar (contents z))
    )
    (else
      (error "Unknown type -- ANGLE" z)
    )
  )
)

;---------------------------------------------
;虚数の演算
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
