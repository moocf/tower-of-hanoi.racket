#lang racket
; (toh ldisk to): List(Int) X Int -> List(List(Int))
; returns the positions of each disk per move till solution
(define toh
  (lambda (ldisk to)
    (if (null? ldisk)
        '()
        (let*
            ([disk (car ldisk)]
             [mid (- 6 to disk)]
             [rest (make-list (- (length ldisk) 1) mid)])
          (append
           (if (= disk to)
               '()
               (map (lambda (v) (cons disk v))
                    (toh (cdr ldisk) mid)))
           (if (= disk to)
               '()
               (list (cons to rest)))
           (map (lambda (v) (cons to v))
                (toh rest to)))))))
