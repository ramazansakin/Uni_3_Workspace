;;
;; A lexer for subset of the scheme language.
;;
;; For more details see the homework description.
;;

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;    HOMEWORK-2
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;    Programming Languages
 ;;;;;;;;;;;;;;;;;;;;;;;;;    Ramazan Sakin - 111044069
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Required strings to understand token
( define iden-chars "!$%&*+-./:<=>?@^_~()" )
( define alpha-num "abcdefghIijklmnoprstüUvxyz1234567890" )

; Strings to use to display Tokens and its Lexemes properly to user
( define  token    "TOKEN" )
( define  lexeme   "LEXEME" )
( define  tire     "--------------------------------------------------------------"  ) 

;; -------------------------------------------
;; Helper functions ...
;; LEX-HELPER
;; p -> program codes ( as a string ) , start -> start index of the program
;; end -> end index of the program 

;; lex-helper fonksiyonu program kodunu trace ediyor ve token lara ayırarak token-definer fonksiyonuna gönderiyor 	
;; Eger token-definer da varsa böyle bir token , token ın lexeme karsılıgını döndürüyor.
;; Recursive cagrılarak diger token lar aranıyor.
;; Eger space , new line, tab vb. gibi karakterlerle karsılasılırsa bunlar atlanıyor.
;; Tokenları alırken programda sürekli start ve end indexleri ile ilerleniyor.
;; Token bulunana kadar start sabit end index i ilerliyor token bulununca da ikiside ilerliyor.
;; Bu sayede string bozulmadan string i trace ederek token larına ayrılıyor.
;; End index i program kodunun lenght ine ulastıgı zaman da program recursive cagırmayı duruduruyor.

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


; TOKEN-DEFINER 
; INPUT : w -> token to search its lexeme
; OUTPUT : token's lexeme if there is o.w return "not"
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
			(  ( substring?  w  iden-chars ) 							"IDENTIFIER" 	)
			(  ( string?  w  )                  						"IDENTIFIER" )
			(  #t  														"not" 	     )

		)
	)
)


; SPACE-GENERATOR
; INPUT : w-len -> word lenght to be displayed with required-lenght space to screen
; OUTPUT : displayed space-string
( define space-generator
	( lambda (  w-len  )
		( display ( make-string ( - 46  w-len )  #\space ))

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

