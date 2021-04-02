;; Extra Scheme Questions ;;


; Q5
(define lst
  (cons
    (cons 1 nil)
    (cons 2
          (cons (cons 3 4)
                (cons 5 nil)
          )
    )
  )
)

; Q6
(define (composed f g)
  'YOUR-CODE-HERE
  (lambda (x) (f (g x)))
)

; Q7
(define (remove item lst)
  'YOUR-CODE-HERE
  (cond
    ((null? lst) ())
    ((= item (car lst)) (remove item (cdr lst)))
    (else (cons (car lst) (remove item (cdr lst))))
  )
)


;;; Tests
(remove 3 nil)
; expect ()
(remove 3 '(1 3 5))
; expect (1 5)
(remove 5 '(5 3 5 5 1 4 5 4))
; expect (3 1 4 4)

; Q8
(define (no-repeats s)
  'YOUR-CODE-HERE
  (cond
    ((null? s) ())
    (else (cons (car s) (no-repeats (remove (car s) (cdr s)))))
  )
)

; Q9
(define (substitute s old new)
  'YOUR-CODE-HERE
  (cond
    ((null? s) ())
    ((pair? (car s)) (cons (substitute (car s) old new)
                           (substitute (cdr s) old new)))
    ((eq? (car s) old) (cons new (substitute (cdr s) old new)))
    (else (cons (car s) (substitute (cdr s) old new)))
  )
)

; Q10
(define (sub-all s olds news)
  'YOUR-CODE-HERE
  (cond
    ((null? olds) s)
    (else (sub-all (substitute s (car olds) (car news)) (cdr olds) (cdr news)))
  )
)
