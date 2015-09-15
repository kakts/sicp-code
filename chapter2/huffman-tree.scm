;Huffman treeの実装

; 葉の節は記号leaf その葉の記号と重みのリストで表現
(define (make-leaf symbol weight)
  (list 'leaf symbol weight)
)

; 葉かどうか判定する
(define (leaf? object)
  (eq? (car object) 'leaf)
)

; 葉のsymbolを取得
(define (symbol-leaf x) (cadr x))

; 葉の重みを取得
(define (weight-leaf x) (caddr x))

(define (make-code-tree left right)
  (list
    left
    right
    (append (symbols left) (symbols right))
    (+ (weight left) (weight right))
  )
)

(define (left-branch tree) (car tree))

(define (right-branch tree) (cadr tree))

(define (symbols tree)
  (if (leaf? tree)
    (list (symbol-leaf tree))
    (caddr tree)
  )
)

(define (weight tree)
  (if (leaf? tree)
    (weight-leaf tree)
    (caddr tree)
  )
)


;---------------------
; Huffman tree 復号化
(define (decode bits tree)
  (define (decode-1 bits current-branch)
    (if (null? bits)
      '()
      (let ((next-branch (choose-branch (car bits) current-branch)))
        (if (leaf? next-branch)
          (cons (symbol-leaf next-branch)
            (decode-1 (cdr bits) tree)
          )
          (decode-1 (cdr bits) next-branch)
        )
      )
    )
  )

  (decode-1 bits tree)
)

(define (choose-branch bit branch)
  (cond
    ((= bit 0) (left-branch branch))
    ((= bit 1) (right-branch branch))
    (else (error "bad bit -- CHOOSE_BRANCH" bit))
  )
)
