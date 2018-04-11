


(define (factorial n)
	(if (zero? n) 1
		(* n (factorial (- n 1)))))



(define (fibonacci n)
	(if (< n 2) 
		n
		(+ (fibonacci (- n 1))  (fibonacci (- n 2)))

		))




(define (fahren celsius)
	(+ (* 1.8 celsius ) 32 )  )



( define ( sum myList )
	(if ( null? myList ) 0
		( + ( car myList ) ( sum ( cdr myList ) ) ) ) )



(define (concat strings accum)
	(if (null? strings) '()
		(cons (string-append accum (car strings))
		(concat (cdr strings)
		(string-append accum (car strings))))))



(define greet
  (lambda (name  surname)
    (string-append "Hello, " name " " surname)))



(define (factorial n)
	(cond ((= n 0) 1)
	(else (* n (factorial (- n 1))))
	)
	)

(define reduce
  (lambda (op l id)
    (if (null? l)
       id
       (op (car l) (reduce op (cdr l) id)) )))
       
       

; (cond ((control1) op1) ((control2) op2) ... (controlN) opN)))
(define isZero ; zero? is name of the function
	(lambda ; temporary nameless function
		(x) ; input parameter
		(cond ; conditions are evaluated in sequence from top to bottom
			((equal? 0 x) 'zero) ; if x = 0 return 'zero symbol
			; ...
			; ...
			(#t 'non-zero) ; always true, so return 'non-zero
		)
	)
)



( define ( ifs  n )

	(if ( > n 10 )
		( display 'OK )
		( and (display 'NO)
		  (display 'NO) )
		)

	)


( define sum 0 )

( define (sumall n1 n2 )

	(if ( = n1  ( + 1 n2)  )
		( and  ( display sum ) ( set! sum 0 ) )
		( and ( set! sum ( + sum n1 ) )  ( sumall ( + n1 1 ) n2 )  )
		)

)

;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;
;;;;;;;;;  HW 1 ;;;;;;;;;;;

;;encode a document
;;INPUT: a document "d" and a "encoder"
;;OUTPUT: an encoded document using a provided encoder
(define encode-d;;this encoder is supposed to be the output of "encode-n"
  (lambda ( d encoder )
      
      (if ; if (a < b) { a = a * b; } else { a = a / b;}
        ( null? d ) ; control part
        ( begin (newline) (display 'Completed ) ) ; then part
        ;no else if
        ( begin ( map ( lambda ( x ) ( ( encode-n  4 )  x  ) )  ( car d ) )   
                
                ( encode-d  ( cdr d )  encode-n ) ) ; else part
      
      )
      
    ) )




( define (encr w n )
    
	(map (lambda (val) (vtc (modulo (+ n (ctv val)  ) 23 ) )  ) w  )

) 

