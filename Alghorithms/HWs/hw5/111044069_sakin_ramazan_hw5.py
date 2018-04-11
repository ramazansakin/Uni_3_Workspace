#!/usr/bin/python
# -*- coding: utf-8 -*-

    ######################################################
   ########################################    HOMEWORK-5
  #########################    Ramazan Sakin - 111044069
 ##################    Introduction to Algorithm Design
######################################################



#(bu soruyu dinamik programlama ile cozunuz.)
#soru 1 : bu fonksiyon A=[p0,p1,p2,....,pn] seklinde bir listeyi input olarak aliyor.
# A1=p0xp1  , A2=p1xp2   , A3=p2xp3  ..... , An=pn-1Xpn   boyularinda matrisler olsun.
# A1xA2x....xAn  carpimini en az sayýda islemle yapmak icin carpma islemlerinin hangi sirada yapilmasi gerektigini belirten
#bir fonksiyon yaziniz.
# A=[5,4,6,2,7]   icin ekrana basilan  sonuc :  "((A1x(A2xA3))xA4)"  olmalidir.

print "Question - 1 - Sample Outputs #####################################"

#  fonksiyon verilen arraydeki satır sütun sayılarına gore en az sayıda carpama iceren sıralamayı döndürür
def carpmaSirasi(A):
       
    # sıralamanın tutuldugu array 
    order = []
    minV = float('inf')
    # en sonki işlem yapılan matrisin satır ve sutun sayısı tutularak bu degerler üzerinden
    # işlem devam eder ( dinamik olarak )
    row  = 0
    col  = 0
    count = 0

    # bu dongude işlem yapılan ilk iki matris bulunuyor ve diger matrislerde bu matris uzerinde carımları
    # en dusk olan alınarak sıralama bulunuyor.
    for i in range(0,len(A)-2):
        if  A[i] * A[i+2] < minV :
            minV = A[i] * A[i+2]
            row = i
            col = i+2
    
    # matrisler sıraya konuyor
    order.append(row+1)
    order.append(row+2)

    # sıralamanın bulunması ..
    # en sonki row ve col güncel olarak devam eder.
    end = 0
    while ( end == 0):
        if ((row - 1) >= 0)  & ((col+1) <= len(A)-1) :
            if  ( A[row-1] * A[col] < A[row] * A[col+1] ):
                order.append(row)
                row = row-1
            else:
                order.append(col+1)
                col = col+1
                
        elif ((row - 1) >= 0) :
            order.append(row)
            row = row-1
        elif  ((col+1) <= len(A)-1) :
            order.append(col+1)
            col = col+1
        else:
            # eger matris kalmamıssa dongu bitirilir.
            end = 1     # for out of loop

    return order

# helper function for finding the smaller one to
# create ordered multiplication of matrixes
def isSmaller(B, i):

    for t in range(0,i):
        if B[t] < B[i] :
            return 0
    return 1


# sample matrixes to check function
A = [ 5, 8, 5, 4, 2, 7 ]
B = carpmaSirasi(A)

sentence = "" 

print "En az sayıda carpma işlemi ile yapılma sırasına göre : "

# combining strings
for i in range( 0, len(A)-1 ):
    if i == 0:
         sentence = sentence + ("A%d" % B[i])
    else :
        temp = isSmaller(B, i)
        if temp == 1:
            sentence = ("(A%dx" % B[i]) + sentence + ")"
        else:
            sentence = "("+sentence + ("xA%d)" % B[i]) 

# answer string for carpim sirasi 
print sentence


#(bu soruyu dinamik programlama ile cozunuz.)    
#soru 2: bu fonksiyon n tane tam sayidan olusan bir listeyi input olarak aliyor. Listemiz S olsun.
#n tane pozitif tam sayýdan oluþan bir kümeyi öyle iki parçaya bölün ki |A1 – A2| deðeri minimum
#olsun. Burada A1 ve A2 iki alt kümedeki elemanlarýn
#toplamýdýr. Örn: S={1,2,3,4} olsun. Bu
#durumda S1={1,4} ve S2={2,3} iki alt kümemiz olur.
#A1=5 ve A2=5 olur. |A1-A2| =0 'dir.. 

print ""
print ""
print "Question - 2 - Sample Outputs #####################################"

def balancePart(S):
    
    S1 = []
    S2 = []

    for i in range( 0, len(S), 1 ) :
        if ( sum(S1) > sum(S2) ):
            S2.append( S[i] )
        else:
            S1.append( S[i] )

    while ( sum(S1) - sum(S2) ) > min(S1):
        S2.append(min(S1))
        del S1[ S1.index(min(S1)) ]

    while ( sum(S2) - sum(S1) ) > min(S2):
        S1.append(min(S2))
        del S2[ S2.index(min(S2)) ]

    return S1,S2


A = [ 1 ,2, 3,4 ]
print "Balanced two lists are :"
print balancePart(A)


#(bu soruyu dinamik programlama ile cozunuz.)
#soru 3: bu fonksiyon A ve B seklinde iki stringi input olarak aliyor. Sonuc olarak en uzun ortak alt dizinin uzunlugunu donduruyor.
# ve ekrana output olarak A ve B 'deki  ortak alt diziyi/dizileri basiyor.
#A=<a1,a2,a3,....,an> , B=<b1,b2,b3,....,bm> iki dizi olsun. A ve B içindeki C=<c1,c2,c3,..,ck>
#seklindeki en uzun ortak alt diziyi bulunuz. Örn: X="ABCBDAB" ve Y="BDCABA"
#olsun. En uzun ortak dizi Z="BDAB" olur. (birden fazla en uzun ortak alt dizi olabilir.) 
# bu ornekte fonksiyon 4 dondurmeli ve Ekranana :
#"BDAB"
#"BCAB"
#"BCBA" .... seklinde butun en uzuk ortak alt dizileri basmalidir. (Ekrana basilan alt dizilerin sirasi onemli degil)

print ""
print ""
print "Question - 3 - Sample Outputs #####################################"

def longestCommonSubstring(A, B ):
    
    longest=0
    longList = ""
    subStr = ""
    res = 0
    longestLs = []


    for i in range(0, len(A)):
        longest = 0
        subStr = ""
        k = i
        
        for j in range( 0, len(B)):

            if A[k] == B[j]:
                longest = longest + 1
                subStr+= B[j]
                if k < len(A)-1:
                    k = k+1
        

        if k < len(A):
            for l in range(k, len(A) ) :
                if A[l] == B[len(B)-1] :
                    longest = longest+1
                    subStr += B[len(B)-1]
                    l = len(A)+1

        
        longestLs.append(subStr)
        if res <= longest :
            res = longest
            longList = longList+subStr+"  "

    print "Longest common substrings : "
    for i in range(0,len(longestLs)):
        if res == len(longestLs[i]):
            print longestLs[i]


    return res


A = "ABCBDABACBACDE"
B = "BDCABAACDEDACEDADCA"   

print  "Longest common substring lenght is %d" % longestCommonSubstring( A, B )


# (greedy algorithm)
#soru 4 : bir kopruyu gecmek isteyen n kisi var. Bunlarin kopruyu gecme hizlari A=[s1,s2,s3,...,sn]. A listesi fonksiyona input olarak veriliyor.
# Bu n kisiden olusan grubun elinde bir tane fener var ve gece kopruyu gecmeleri gerekiyor. Kopruyu fener olmadan gecemiyorlar.
# Hizli giden biriyle yavas giden biri birlikte kopruyu gecerlerse yavasin hizinda geciyorlar.
# Ornegin kopruyu 1 dakikada gecen biriyle 3 dakikada gecen biri birlikte kopruyu gecerse 3 dakikada geciyorlar. Kopruden ayni anda en fazla 2 kisi 
# gecebiliyor. 2 kisi karsiya gectikten sonra bir kisinin feneri grubun karsida kalan uyelerine geri goturmesi gerekiyor.
#bu fonsiyon input olarak kisilerin gecme surelerini iceren bir A listesi aliyor ve sonuc olarak grubun karsiya gecmesi icin gereken toplam sureyi
#donduruyor. Ayrica ekrana "1 ve 4 karsiya gectiler" , "4 feneri geri getirdi " , "3 ve 5 karsiya gectiler" seklinde sonuclar basmasi isteniyor.
#bu soruda amac grubu minimum zamanda karsiya gecirmek. Bu soruda cozumun kalitesine gore puan verilececektir.
print ""
print ""
print "Question - 4 - Sample Outputs #####################################"

def karsiyaGecmeSuresi( A ):
    # variables
    timee=0

    # en kısa sürede kopruyu gecen kişi surekli feneri getirip götürme işlemini yaptıgı zaman
    #  daha kısa sürede butun insanlar gecebiliyor Cunku fenerin geri götürülme işlemi her
    # bir insandan sonra yapılacagı icin kısa sürede olöası gerekir. 
    # 3 farklı yol denedim en hızlılar once en yavaslar sonra ve bir en hızlı ile en yava 
    # 2. en hızlı ile 2. en yavas ama bu 2 method da da ilk metoda göre daha uzun sürüyor..

    # find the fastest person to transport the fener :)
    # tasıma işi surekli yapıldıgı için en hızlı kişinin kullanılması diger durumlardan daha
    # verimli oluyor..
    
    # Hocam aslında baska bir algoritma bulmustum da onu implement ettigimde hata aldım ve duzeltemedim
    # ondan önce bunu dusunmustum bunu yazdım
    # onceki algoritma: Birbirine en yakın ( kopruyu gecme suresi olarak ) kişileri beraber geciririz
    # ve her seferinde karsıdaki kişilerden en hızlıyı geri gonderirirz.
    # Bu sekilde yapıldıgında daha kısa suruyor..
      
    p1 = min(A)
    minInd = A.index(min(A))

    for i in range(0, len(A) ):
        if i != minInd :
            print minInd+1, ". ve ",(i+1), ". birlikte karşıya geçtiler  ",A[i]," dakika"
            if ( i != len(A)-1 ):
                print minInd+1,". Feneri geri getirdi. ",p1," dakika."  
            timee = timee + p1 + A[i]

    # son gecisten sonra geri dönülmeyecegi icin tekrar eklenmez( son dongudeki eklenen cıkartılır. )
    timee = timee - p1
    
    return timee


T = [4, 3, 5, 6]
print "Toplam %d dakika." % karsiyaGecmeSuresi(T)




