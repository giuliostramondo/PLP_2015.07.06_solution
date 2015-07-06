#lang racket
;Giulio Stramondo
;Date 06/07/2015

(define (clos2)
  (let ((curr 0))
    (lambda (i)
      (if (eqv? i 'end)
          curr
          (set! curr (+ curr i))
        )
      )
    )
  )

(define (clos1)
  (let ((lst '()))
    (lambda(i)
      (if (eqv? i 'end)
          lst
          (set! lst (cons i lst))
       )
     )
   )
 )

(define (producer ag1 ag2)
  (let loop ((i 1))
    (if (< i 10)
        (begin 
          ((if (odd? i) ag1 ag2) i)
          (loop (+ i 1)))
        (cons
         (ag2 'end)
         (ag1 'end))
        )
    )
  )

;(producer (clos1) (clos2))
;returns '(20 9 7 5 3 1)

(define-syntax multiple-apply
  (syntax-rules (to)
    ((_ (fun ...) to lst ...)
     (list (apply fun lst) ...))
    )
  )

;(multiple-apply (+ - *) to '(1 2 3) '(3 4) '(9 -2))
;returns '(6 -1 -18)