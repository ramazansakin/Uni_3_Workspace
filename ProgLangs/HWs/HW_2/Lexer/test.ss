;;
;; Code for testing the Scheme lexer.
;;

(load "lexer.ss")

(define test1 (lambda () (lexer test_prog_1)))

(define test2 (lambda () (lexer test_prog_2)))

( define test3 (lambda () (lexer test_prog_3))  )

;; When the lexer is called with the following program as argument, the result should be a list of tokens with:
;; ( (LPAREN ")") (IDENTIFIER "+") (IDENTIFIER "1") (IDENTIFIER "y") (RPAREN ")") )
(define test_prog_1 "(+ 1 y)" )


(define test_prog_2 "(define factorial (lambda (n) (if (= n 1) 1 (+ n (factorial (- n 1))))))" )

(define test_prog_3 "(define factorial
                        (lambda (n)
                            (if (= n 1) 1 (+ n (factorial ( not (- n 1)))))))" )



