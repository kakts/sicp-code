# queue implementation.

# return front pointer
(define (front-ptr queue) (car queue))

# return rear pointer
(define (rear-ptr queue) (cdr queue))

# set front pointer
(define (set-front-ptr! queue item) (set-car! queue item))

# set rear pinter
(define (set-rear-ptr! queue item) (set-cdr! queue item))

# check if queue is empty
(define (empty-queue? queue) (null? (front-ptr queue)))

# Initialize queue object
(define (make-queue) (cons '() '()))

# get front data of queue
(define (front-queue queue)
	(if (empty-queue? queue)
		(error "FRONT called with an empty queue" queue)
		(car (front-ptr queue))
	)
)

(define (insert-queue! queue item)
	(let ((new-pair (cons item '())))
		(cond ((empty-queue? queue)
			(set-front-ptr! queue new-pair)
			(set-rear-ptr! queue new-pair)
			queue
		)
		(else
			(set-cdr! (rear-ptr queue) new-pair)
			(set-rear-ptr! queue new-pair)
			queue
		)

		)
	)
)

(define (delete-queue! queue)
	(cond ((empty-queue? queue)
		(error "DELETE called with an empty queue" queue))
		(else
			(set-front-ptr! queue (cdr (front-ptr queue)))
		)

	)
)
