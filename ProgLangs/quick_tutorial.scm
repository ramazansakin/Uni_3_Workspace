; Most of the codes are taken from links below:
; http://www.shido.info/lisp/idx_scm_e.html
; http://classes.soe.ucsc.edu/cmps112/Spring03/languages/scheme/SchemeTutorialB.html
; 
this is a comment
; space, tab, new line are separators

; ATOM
; booleans, numbers, characters, strings 
1 ; atom as an integer
1.2 ; atom as a floating point
1/2 ; atom as a fraction
#\a ; character
"hobarey!" ; atom as a string
'symbol ; atom as an immutable value/object
#t ; true
#f ; false


; DECLARING VARIABLE
; binds value to symbol
( define mylist (list "this" "is" "my" "list"))

(define val 1) ; define variable val
(set! val (* val 5)) ; val = val * 5; run assignment


(let ; local variable declaration
	(
		(i 5) ; initialize variable
	)
	(* i 2) ; operation using variable
)

(let ; let with 2 input parameters
	(
		(i 5) 
		(j 2)
	)
	(* i j)
)

(let* ; sequential assignment 
	(
		(i 5) ; first assignment
		(j i) ; second assignment
	)
	
	
	(* i j) ; operation
)


; PROCEDURE CALL
(+ 1 2 3) ; 6
(/ 1 2 3) ; 1/6
(= 1 1) ; #t
(= 1 2) ; #f
(< 3 4) ; #t
(>= 3 4) ; #f


(equal? 'a 'b) ; #f equal? compares two objects
(equal? 'a 'a) ; #t
(equal? 1 1) ; #t
(equal? '(a b (c d)) '(a b (c d))) ; #t   !!!
(null? '(a)) ; #f null? returns #t only on the empty list.
(null? '()) ; #t
(not #t) ; #f
(not #f) ; #t
(string>? "abc" "def") ; #f
(string>? "def" "abc") ; #t


; LIST
'("this" "is" "my" "list") ; list
(list "this" "is" "my" "list")
'() ; empty list

(car '(a b c)) ; 'a
(cdr '(a b c)) ; '(b c)
(cdr '(b c)) ; '(c)
(cdr '(c)) ; '()

(cons 1 (cons 2 '()))
(cons 1 '())  ; (list 1)
(cons 1 2) ; (list 1 2)
(cons 'a '(b c)) ; '(a b c) 
(cons (car '(a b c)) (cdr '(a b c))) ; '(a b c)
(append '(first list) '(second list)) ; '(first list second list)

(+ 1 2) ; + is an operator
(quote (+ 1 2) ) ; + is not an operator


; IF-THEN-ELSE
(if ; if (a < b) { a = a * b; } else { a = a / b;}
	(< a b) ; control part
	(set! a (* a b)) ; then part
	;no else if
	(set! a (/ a b)) ; else part
)

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


(define (lettergrade final)
	(cond
		((<= 90 final) "AA")
		((<= 80 final 89) "BB")
		((<= 70 final 79) "CC")
		((<= 60 final 69) "DD")
		((<= 50 final 59) "EE")
		(else "FF")
	)
)

; (define (fName param1 ... paramN) (operations))


; LAMBDA FUNCTION
(lambda
	() ; empty input parameter list
	"Hello world") ; operations
)


(lambda ; lambda with param list
	(num1 num2 num3) ; params
	(* num1 num2 num3) ; operations using params
) 

(
	(lambda ; lambda with param values
		(num1 num2 num3)
		(set! val (* num1 (+ num2 num3) ))
	) 1 2 3 ; param values
) 


; DEFINING FUNCTION WITH LAMBDA
(define
	pow2 ; function name
	(lambda ; lambda function
		(x) ; only one input parameter
		(* x x) ; operation
	)
)

(define
	avg2
	(lambda
		(x y) ; two parameters
		(/ (+ x y) 2)
	)
)


; DEFINING FUNCTION WITHOUT LAMBDA
(define ; short version
	(div3 par1 par2 par3)
	(/ par1 par2 par3)
)


; LOOP and RECURSION
(define factorial
	(lambda (n)
		(cond
			((= 0 n) 1)
			(#t (* n (factorial (- n 1))))
		)
	)
)



(define ; recursion
	(fact n)
	(if
		(= n 1)
		1
		(* n (fact (- n 1)))
	)
)



(define ; tail recursion
	(tailrecfactorial number value)
	(if
		(= number 1)
		value
		(let
			((m (- number 1)))
			(fact-rec m (* value m))
		)
	)
)



(define
	(factlet n)
	(let loop((tempNum n) (tempVal n))
		(if
			(= tempNum 1)
			tempVal
			(let
				((m (- tempNum 1)))
				(loop m (* tempVal m))
			)
		)
	)
)



; DO
(define
	(factdo n)
	(do
		( ; initializations and updates
			(tempNum n (- tempNum 1))
			(tempVal n ((* tempVal (- tempNum 1))))
		)
		(
			(= tempNum 1) ; loop control
			tempVal ; return value
		)
	)
)




; MAP FUNCTION
(map  
    (lambda (n) (* 2 n))   '(1 2 3 4 5 6)
     
     )

