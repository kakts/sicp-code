;代数微分を行う

;変数かどうか
(define (variable? x)
  (symbol? x)
)

(define (same-variable? v1 v2)
  ;v1 v2どちらも変数かつ　等しい場合
  (and (variable? v1) (variable? v2) (eq? v1 v2))
)

;和と積はリストとして構成する
(define (make-sum a1 a2) (list '+ a1 a2))
(define (make-product m1 m2) (list '* m1 m2))

;和は最初の要素が + であるリストである
(define (sum? x)
  (and (pair? x) (eq? (car x) '+))
)
;加数は和のリストの第二項である
(define (addend s)
  (cadr s)
)
;非加数は和のリストの第3項である
(define (augend s)
  (caddr s)
)

;積は最初の要素が * であるリストである
(define (product? x)
  (and (pair? x) (eq? (car x) '*))
)
;乗数は積のリストの第二項
(define (multiplier p)
  (cadr p)
)
;非乗数は積のリストの第３項
(define (multiplicand p)
  (caddr p)
)

;make-sum改良版
;make-sumを以下の方法で変更したmake-sum-2を使って簡略化する
;・両方の被演算子が数値なら それらを足す
;・被演算子の一方が0なら　もう一方の被演算子を返す
(define (make-sum2 a1 a2)
  (cond
    ((=number? a1 0) a2)
    ((=number? a2 0) a1)
    ((and (number? a1) (number? a2) (+ a1 a2)))
    (else (list '+ a1 a2))
  )
)
(define (=number? exp num)
  (and (number? exp) (= exp num))
)

;make-product改良版
;被演算子に0がある場合は0を返す
;被演算子のどちらかが1の場合は,もう一方を返す
(define (make-product2 m1 m2)
  (cond
    ((or (=number? m1 0) (=number? m2 0))
      0
    )
    ((=number? m1 1) m2)
    ((=number? m2 1) m1)
    ((and (number? m1) (number? m2))
      (* m1 m2)
    )
    (else (list '* m1 m2))
  )
)

;微分
(define (deriv exp var)
  (cond
    ((number? exp) 0) ;数値ならば0
    ((variable? exp)
      (if (same-variable? exp var) ;同一変数なら 1 dx/dx = 1より
        1
        0
      )
    )
    ((sum? exp) ;和の場合
      (make-sum2
        (deriv (addend exp) var)
        (deriv (augend exp) var)
      )
    )
    ((product? exp) ;積の場合
      (make-sum2
        (make-product2
          (multiplier exp)
          (deriv (multiplicand exp) var)
        )
        (make-product2
          (deriv (multiplier exp) var)
          (multiplicand exp)
        )
      )
    )
    (else ;それ以外の場合はエラー
      (error "unknown expression type --DERIV" exp)
    )
  )
)

; f(x) = x + 3の xに対する微分
(print (deriv '(+ x 3) 'x))
(print (deriv '(* x y) 'x))
(print (deriv '(* (* x y) (+ x 3)) 'x))
