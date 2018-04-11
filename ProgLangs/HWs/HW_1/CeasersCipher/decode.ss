;; contains "ctv", "vtc",and "reduce" definitions
(load "include.ss")

;; contains a test document consisting of a number of paragraphs. 
(load "document.ss")

;; contains a test-dictionary, which has a much smaller dictionary for testing
;; the dictionary is needed for spell checking
;(load "test-dictionary.ss")


(load "dictionary.ss") ;; the real thing with 18,000 words
;; -----------------------------------------------------
;; HELPER FUNCTIONS

; Gen-Decoder-B -> Hangi harfin kac defa gectigini bulup 
; en cok gecen harfe ( It s up to analsys for most frequent letter in Turkish or English )
( define alpha '( a b c d e f g h i j k l m n o p r s t u v x y w z ) )

;; encoder-helper
;; INPUT  : l -> word list to be encoded
;; OUTPUT : encoder -> encode-n for encoding each word 
( define encoder-helper
  (lambda (l encoder )
    (map (lambda( x )(  encoder  x ) )  l )
  )
)


;COMPARATOR : Helper of Checker
;; INPUT: w : a word -> gotten word from paragrapgh to look dictionary if there is or not 
;; dict-word : a word from dictionary to compare the word 
;; OUTPUT: if there is  true(#t)  o.w. false(#f)
(define comparator
  ( lambda ( w  dict-word )

      ( cond
        ( ( and  (null?  w )  ( null? dict-word )  ) #t )
        ( ( or   (null?  w )  ( null? dict-word )  ) #f )
        ( ( eq?  ( eq?  ( car w )  ( car dict-word ) )  #f  )  #f )
        ( else  ( comparator ( cdr w )  ( cdr dict-word ) ) )
        )
  )  
)


; CHECKER
;INPUT  :  w : a word to compare , dictionary
;OUTPUT ; if there is  true(#t)  o.w. false(#f)

( define checker 
  (lambda ( w  dictionary )
    (cond
      ( ( null?  dictionary ) #f )
      ( ( eq?  ( comparator w  ( car dictionary ) ) #t ) #t )
      ( else ( checker w ( cdr dictionary ) ) )
    )
      
  )
)



;; Code-Breaker-helper-A
;; INPUT  :  num -> to shift the document,  d -> user-defined document , maxn -> which shifthed is better ,
;; dec-n -> actual number to decode the document
;; OUTPUT ; dec-n -> neccessary number to decode the doc.
( define Code-Breaker-helper-A
  ( lambda( num  d  maxn dec-n ) 
      ; Some displayed words to debug
      ;( begin  (display num) (newline) (newline) )
      ;( begin ( display dec-n ) (display "--") (display maxn ) (display "--") (display num) (newline) )
      ;( display ( reduce + ( map ( lambda(x) ( Gen-Decoder-A-helper-2  x ) ) ( encode-d d ( encode-n num ) ) ) 0 ) )

      ; EXPLANATION OF FUNCTION
      ; Bu fonksiyon herbir recursive cagırısta verilen documanı "num" a gore shift edip dictionary ile kac tane uyusan
      ; kelime varsa onu dondurur ve bunu herbir shift icin yaparak en cok uyumu saglayan shift number ı dondurur.
      ; Ve ona  gore dokuman decode edilir
      (cond
        ( ( eq? num  23 ) dec-n )
        ( ( <  maxn  ( reduce + ( map ( lambda(x) ( Gen-Decoder-A-helper-2  x ) ) ( encode-d d ( encode-n num ) ) ) 0 )  ) 

          (Code-Breaker-helper-A  (+ num 1)  d  ( reduce + ( map ( lambda(x) ( Gen-Decoder-A-helper-2  x ) ) ( encode-d d ( encode-n num ) ) ) 0 ) num ) )
      
        ( else  (Code-Breaker-helper-A  (+ num 1)  d  maxn dec-n ) )

      )
  )
)


;; Code-Breaker-helper-A-2
;; INPUT  :  p -> paragraph of the doc. to decode
;; OUTPUT ; number () to understand which shifted number is more true
( define Gen-Decoder-A-helper-2
  ( lambda( p )
    ; Some displayed words to debug
    ;( begin (display p) (newline) (newline) )
    ;(display ( reduce + ( map ( lambda (x) ( Gen-Decoder-A-helper-3  x ) ) p )  0 ) )  
    ( reduce + ( map ( lambda (x) ( Gen-Decoder-A-helper-3  x ) ) p )  0 )

  ))

;; Code-Breaker-helper-A-3
;; INPUT  :  num -> to shift the document,  d -> user-defined document , maxn -> which shifthed is better ,
;; dec-n -> actual number to decode the document
;; OUTPUT ; dec-n -> neccessary number to decode the doc.

( define Gen-Decoder-A-helper-3
  ( lambda( decoded-word  )

    ;(display (decoded-word) (newline) )
    ( cond
      ( ( eq? ( spell-checker  decoded-word )  #f  )  0  )
      ( ( eq? ( spell-checker  decoded-word )  #t  )  1  )

     )

  )
)

;; Code-Breaker-helper-B
;; INPUT  :  num -> index of the alpha ,  d -> user-defined document , maxn -> which char is better to decode ,
;; most-freq -> most-frequent char in the encoded doc. ( using replacement to decode )
;; OUTPUT ;  most-frequent char in the encoded doc. ( using replacement to decode ) ( recursion )
( define Code-Breaker-helper-B
  ( lambda( num d maxn most-freq ) 
      ; Some displayed words to debug
      ;( begin  (display num) (newline) (newline) )
      ;( begin ( display dec-n ) (display "--") (display maxn ) (display "--") (display num) (newline) )
      ;( display ( reduce + ( map ( lambda(x) ( Gen-Decoder-A-helper-2  x ) ) ( encode-d d ( encode-n num ) ) ) 0 ) )

      ; EXPLANATION OF FUNCTION
      ; Gen-Decoder-A-helper-2 dokumandaki dogru cevrilis word satısını verdigi icin burda da kullandım
      ; Once Code-Breaker-helper-B dokumanı alıp helper lar ile encode edilmiş dokumandaki encok gecen char ı
      ; buluyorum ( alfabedeki  butun harflere bakıp ) daha sonra onun yerine 'a koydugumda ne kadar dogru oldugunu da 
      ; Gen-Decoder-A-helper ile buluyorum daha sonra aynı işlemleri 'e ve 'b koyarak yapıp en cok dogru word hangisinde varsa
      ; on gore dokumanı decode ediyorum ( n + n' = 23 kullanarak )
      (cond
        ( ( eq? num  25 )  most-freq )
        ( ( <  maxn  ( reduce + ( map ( lambda(x) ( Gen-Decoder-B-helper-2  x num ) ) d ) 0 )  ) 

          (Code-Breaker-helper-B ( + 1 num )  d  ( reduce + ( map ( lambda(x) ( Gen-Decoder-B-helper-2  x num ) ) d ) 0 )  ( list-ref alpha num ) ) )

        ( else  (Code-Breaker-helper-B  ( + 1 num )   d  maxn  most-freq ) )
      )
  )
)

;; Code-Breaker-helper-B-2
;; INPUT  :  p -> paragraph ,  num -> index of alpha(bet)
;; OUTPUT ;  addition of valid decoded word number for each char ( alpha )
( define Gen-Decoder-B-helper-2
  ( lambda( p num )
    ; Some displayed words to debug
    ;( begin (display p) (newline) (newline) )
    ;(display ( reduce + ( map ( lambda (x) ( Gen-Decoder-A-helper-3  x ) ) p )  0 ) ) 
    ( reduce + ( map ( lambda (x) ( Gen-Decoder-B-helper-3  x num 0 ) ) p )  0 )
  )
)

;; Code-Breaker-helper-B
;; INPUT  :  num -> index of alpha,  word -> a word from the parag.  ,  total -> karakterin word de kac kez gectiginin toplamı
;; OUTPUT ;  total -> karakterin word de kac kez gectiginin toplamı
( define Gen-Decoder-B-helper-3
  ( lambda( word num total )

      (cond
        ( ( null? word  ) total )
        ( ( eq? ( list-ref alpha num ) (car word) ) (Gen-Decoder-B-helper-3 (cdr word) num (+ 1 total) ) )
        ( else ( Gen-Decoder-B-helper-3 ( cdr word ) num total ) )  
        )
 )
)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;   REQUEST   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; Hocam bu test 5 ve test 6 da sizin yazdıgınıza gore ben de hata veriyor ben 
;; Decoder lere dokumanı aynen yolladıgım icin ama bu sekilde Gen_Decoder leri 
;; yazınca bir sıkıntı olmuyo , bu sekilde test 4 - 5 i yaparsanız cok memnun olurum
;; Tesekkurler ...


;; test Code-Breaker with Gen-Decoder-A with everything else
(define test4
  (lambda (n)
    (let 
      ((ds1e (encode-d ds1 (encode-n n)))) ;; first encode the document content in "ds1" using the input n.
      (display ds1) (newline)
      (display ds1e)
      (Code-Breaker ds1e Gen-Decoder-A ) ;; now decode it
    )))

;; test Code-Breaker with Gen-Decoder-B with everything else
(define test5
  (lambda (n)
    (let 
      ((ds1e (encode-d ds1 (encode-n n)))) ;; first encode the document content in "ds1" using the input n.
      (display ds1) (newline)
      (display ds1e)
      (Code-Breaker ds1e Gen-Decoder-B ) ;; now decode it
    )))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;; -----------------------------------------------------
;; SPELL CHECKER FUNCTION
;; check a word's spell correctness
;; INPUT:a word(a global variable "dictionary" is included in the file "test-dictionary.ss", and can be used directly here)
;; OUTPUT:true(#t) or false(#f)
(define spell-checker 
  (lambda ( w )

      (cond
        ( ( eq?  ( checker  w  dictionary ) #t )  #t  )
        ( else  #f )
        ) 
  )
)


;; -----------------------------------------------------
;; ENCODING FUNCTIONS

;;generate an Caesar Cipher single word encoders
;;INPUT:a number "n"
;;OUTPUT:a function, whose input = a word, output = encoded word
(define encode-n
  (lambda (n);;"n" is the distance, eg. n =3: a->d, b->e,...z->c
    (lambda (w);;"w" is the word to be encoded 

      (map 
        ( lambda ( x ) (vtc (modulo (+ n ( ctv x )  ) 23 ) ) )  w )

    )
  )
)


;; -----------------------------------------------------
;; ENCODE-N
;;this encoder is supposed to be the output of "encode-n"
;;INPUT:  d -> document to be encoded ,  encoder ->  encode-n
;;OUTPUT: decoded document acc to shifted num
(define encode-d 
  (lambda ( d encoder )

      ( map  ( lambda ( x ) ( encoder-helper  x  encoder ) )  d  )    
  )
) 



;; -----------------------------------------------------
;; DECODE FUNCTION GENERATORS
;; 2 generators should be implemented, and each of them returns a decoder
;;generate a decoder using brute-force-version spell-checker
;;INPUT:an encoded paragraph "p"
;;OUTPUT:a decoder, whose input=a word, output=decoded word
(define Gen-Decoder-A
  (lambda ( p )
    
    ( encode-d  p ( encode-n  ( Code-Breaker-helper-A  1 p 0 0 )  ) ) 
  )
)


;;generate a decoder using frequency analysis
;;INPUT:same as above
;;OUTPUT:same as above
(define Gen-Decoder-B
  (lambda (p)

    ;Some displayed words to debug
    ;( display (Gen-Decoder-A-helper-2 ( encode-d p ( encode-n ( - 23 ( - (ctv  (Code-Breaker-helper-B 0  p  0  'a ) ) ( ctv 'b ) )  ) ) ) ) )
    ;( display (Code-Breaker-helper-B 0  p  0  'a ) )
    
    ; EXPLANATION OF FUNCTION
    ; Gen-Decoder-A-helper-2 dokumandaki dogru cevrilis word satısını verdigi icin burda da kullandım
    ; Once Code-Breaker-helper-B dokumanı alıp helper lar ile encode edilmiş dokumandaki encok gecen char ı
    ; buluyorum ( alfabedeki  butun harflere bakıp ) daha sonra onun yerine 'a koydugumda ne kadar dogru oldugunu da 
    ; Gen-Decoder-A-helper ile buluyorum daha sonra aynı işlemleri 'e ve 'b koyarak yapıp en cok dogru word hangisinde varsa
    ; on gore dokumanı decode ediyorum ( n + n' = 23 kullanarak ) 
   (cond
   ( ( < (Gen-Decoder-A-helper-2 ( encode-d p ( encode-n ( - 23 ( - (ctv  (Code-Breaker-helper-B 0  p  0  'a ) ) ( ctv 'a ) )  ) ) ) )
        (Gen-Decoder-A-helper-2 ( encode-d p ( encode-n ( - 23 ( - (ctv  (Code-Breaker-helper-B 0  p  0  'a ) ) ( ctv 'e ) )  ) ) ) ) )
        ; do this
        ( encode-d p ( encode-n ( - 23 ( - (ctv  (Code-Breaker-helper-B 0  p  0  'a ) ) ( ctv 'e ) )  ) ) )  )
   ( ( < (Gen-Decoder-A-helper-2 ( encode-d p ( encode-n ( - 23 ( - (ctv  (Code-Breaker-helper-B 0  p  0  'a ) ) ( ctv 'a ) )  ) ) ) )
        (Gen-Decoder-A-helper-2 ( encode-d p ( encode-n ( - 23 ( - (ctv  (Code-Breaker-helper-B 0  p  0  'a ) ) ( ctv 'b ) )  ) ) ) ) )
        ;or do this
        ( encode-d p ( encode-n ( - 23 ( - (ctv  (Code-Breaker-helper-B 0  p  0  'a ) ) ( ctv 'b ) )  ) ) )  )
        ;else do this
        (else  ( encode-d p ( encode-n ( - 23 ( - (ctv  (Code-Breaker-helper-B 0  p  0  'a ) ) ( ctv 'a ) )  ) ) ) )
    )
  )
)


;; -----------------------------------------------------
;; CODE-BREAKER FUNCTION
;;a codebreaker
;;INPUT: an encoded document(of course by a Caesar's Cipher), a decoder(generated by functions above)
;;OUTPUT: a decoded document
(define Code-Breaker
  (lambda (d decoder)

      ( decoder  d )
  )
)


;; -----------------------------------------------------
;; EXAMPLE APPLICATIONS OF FUNCTIONS
;;(spell-checker '(h e l l o))
;;(define add5 (encode-n 5))
;;(encode-d document add5)
;;(define decoderSP1 (Gen-Decoder-A paragraph))
;;(define decoderFA1 (Gen-Decoder-B paragraph))
;;(Code-Breaker document decoderSP1)

