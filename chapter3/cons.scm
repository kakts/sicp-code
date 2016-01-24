;p149 cons
; cons 新しい対を作り出す

; get-new-pair operation is not working; argued at 5.3.1
(define (cons x y)
	(let ((new (get-new-pair)))
		(set-car! new x) ; carポインタをxに置き換える
		(set-cdr! new y) ; cdrポインタをyに置き換える
		new
	)
)

print((cons (list 1 2) (list 3 4)))

print((cons '(1 2) '(3 4)))
