;p91. binary tree

(define (entry tree)
  (car tree)
)

(define (left-branch tree)
  (cadr tree)
)

(define (right-branch tree)
  (caddr tree)
)

(define (make-tree entry left right)
  (list entry left right)
)

// x がsetの要素か判定する
(define (element-of-set? x set)
  (cond
    ((null? set) false)
    ((= x (entry set)) true)
    ((< x (entry set))
      (element-of-set? x (left-branch set)) ; 左側探索
    )
    ((> x (entry set))
      (element-of-set? x (right-branch set)) ; 右側探索
    )
  )
)

// treeへ要素の追加
// 追加の際も、ルートから探索していくので O(log n)ステップが必要
// ・この方法の欠点
// 要素追加するごとに左右の枝のバランスが悪くなる場合がある
// 対策
// 1:数回これを実行するごとに、左右同じ要素をもつ釣り合った木に変換させる処理を施す
// 2:探索と挿入がともにO(log n)で出来る新しいデータ構造を設計する (b-treeなど)
(define (adjoin-set x set)

  (cond
    ((null? set) (make-tree x '() '())) ;setがnullの時、左右が空の木を作る
    ((= x (entry set)) set)
    ((< x (entry set)) ;左側
      (make-tree
        (entry set)
        (adjoin-set x (left-branch set)) ; 左側の枝にx追加
        (right-branch set)
      )
    )
    ((> x (entry set))
      (make-tree
        (entry set)
        (left-branch set)
        (adjoin-set x (right-branch set)) ; 右側の枝に追加
      )
    )
  )
)
