;;
;; A lexer for subset of the scheme language.
;;
;; For more details see the homework description.
;;

( define iden-chars "!$%&*+-./:<=>?@^_~()" )
( define alpha-num "abcdefghIijklmnoprstüUvxyz1234567890" )
( define  token    "TOKEN" )
( define  lexeme   "LEXEME" )
( define  tire     "--------------------------------------------------------------"  ) 

;; -------------------------------------------
;; Helper functions ...

( define lex-helper 
	(lambda( p  start  end )

		(cond
			( ( eq? ( string-length p )  ( - end 1 )  )  ) 	; it ends

			( (char=? ( string-ref ( substring  p  start  end  )  0 )  #\newline ) ( lex-helper p ( + 1 start ) ( + 1 end ) )   )
			
			( ( string=? ( substring  p  start  end  ) " " ) ( lex-helper p  ( + 1 start )  ( + 1 end ) )  )

			( ( string=? ( token-definer  ( substring p start end ) )  "not" )  ( lex-helper p start ( + 1 end ) ) )
			
			( ( substring? ( substring  p  start  end  )   iden-chars )
			(begin
			( newline ) (display ( substring  p start end  ) ) ( space-generator ( string-length ( substring  p  start  end ) ) )	 
				       ( display ( token-definer  ( substring p start end ) ) )  ( lex-helper p end ( + 1 end ) ) ) )

			( ( string=? ( substring  p  end ( + 1 end ) )  " " ) 
			( begin
			( newline ) (display ( substring  p start end  ) ) ( space-generator ( string-length ( substring  p  start  end ) ) ) 
				       ( display ( token-definer  ( substring p start end ) ) )  ( lex-helper p end ( + 1 end ) ) ) )

			( ( substring? ( substring  p  end ( + 1 end ) )  iden-chars  ) 
			( begin
			( newline ) (display ( substring  p start end  ) ) ( space-generator ( string-length ( substring  p  start  end ) ) ) 
				       ( display ( token-definer  ( substring p start end ) ) )  ( lex-helper p end ( + 1 end ) ) ) )

			( (char=? ( string-ref ( substring  p  end ( + 1 end ) )  0 )  #\newline ) 
			( begin
			( newline ) (display ( substring  p start end  ) ) ( space-generator ( string-length ( substring  p  start  end ) ) ) 
				       ( display ( token-definer  ( substring p start end ) ) )  ( lex-helper p  end  ( + 1 end ) ) ) )

			
			( #t    ( lex-helper p  start ( + 1 end ) ) )

		)

	 ) )



( define token-definer
	( lambda( w )

		( cond
			(  ( string=?  w  "(" )  									"LPAREN" )
			(  ( string=?  w  ")" )  									"RPAREN" )	
			(  ( integer? ( string->number w ) )  						"INTEGER_LITERAL" )
			(  ( string=?  w  "#f" )  									"BOOLEAN_LITERAL" )
			(  ( string=?  w  "#t" )  									"BOOLEAN_LITERAL" )
			(  ( string=?  w  "and" ) 									"AND_KEYWORD" 		)
			(  ( string=?  w  "lambda" ) 								"LAMBDA_KEYWORD" 	)
			(  ( string=?  w  "or" ) 									"OR_KEYWORD" 			)
			(  ( string=?  w  "if" ) 									"IF_KEYWORD" 			)
			(  ( string=?  w  "define" ) 								"DEFINE_KEYWORD" )
			(  ( string=?  w  "not" ) 									"NOT_KEYWORD" 	 )
			(  ( string=?  w  "quote" ) 								"QUOTE_KEYWORD"  )
			(  ( char=? ( string-ref  w  0 )  #\" )                     "STRING_LITERAL" )
			(  ( substring?  w  iden-chars ) 							"IDENTIFIER" 	)
			(  ( string?  w  )                  						"IDENTIFIER" )
			(  #t  														"not" 	     )

		)
	)
)


;; -------------------------------------------
;; LEXER
;; 
;; Reads a program from the string argument and returns the token type and the corresponding lexeme...

(define lexer 
	(lambda (p)
		( begin  (display token )  ( space-generator ( string-length token ) ) ( display lexeme ) ( newline ) (display tire)  )
		( lex-helper p  0  1 )

  )
)


( define space-generator
	( lambda (  w-len  )
		( display ( make-string ( - 46  w-len )  #\space )

	 ) ) )

