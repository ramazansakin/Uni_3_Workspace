
    ######################################################
   ########################################    HOMEWORK-2
  #########################    Ramazan Sakin - 111044069
 ##################    Design and Analsys of Algorithms
######################################################

#This python source file is for the algorithm design questions in hw2. 

#You should implement the functions below whose headers are given.

#When evaluating the hw we will first check for correct results. If your function implementation 
#gives correct results next we will check if the correct algorithm is used.

#You may write additional functions if necessary.

#Do not forget to change the name of this file. Do not use turkish characters at the name of the file. 


#Question 1 : This function returns true if there is an  index i such that A[i]=i in list A else returns false. (A is a sorted list) .Function complexity must be O(logn)
def isThereSuchIndex(A):

   firstVal = 0
   endVal   = len(A)

   # binary searching -> O(logn)
   while  True :
        target = (firstVal + endVal ) / 2   # searchs the mid-number
        
        if firstVal > endVal :
            return False           

        if A[target] == target  :
            print "A[%d] == %d " % ( target, target )
            return True
        elif A[target] > target :  # if the number index > number , gets the first part of list
            endVal = target - 1
        else:
            firstVal = target + 1   # if the number index > number , gets the second part of list
    


print "Question - 1 - Sample Outputs #####################################"

    A = [ -1,-2 , 0, 2, 3, 4, 5, 6, 8, -5, 13, 14, 15 ]

if isThereSuchIndex(A):
    print "true"
else:
   print "false"

print " "
print " "

print "Question - 3-a - Sample Outputs #####################################"

#Question 3-a : This function returns a list whose first k elements are the k smallest elements in list A.
#This should be an iterative function .Function complexity must be O(n)
def iterativelyFindKSmallest( A , k ):

    B = []      # new list to hold smallest k element of A list and return
    B.insert( 0, A[0] )     # get the first ele to new list  
    count = 0   

    for i in range( 1,len(A) ) :    # for loop to trace A list from 1. index

        ind = B.index( max(B) )     # get the smallest value to new list or replace with gtreater number
        if B[ ind ] > A[i] :        
            count = count + 1
            if count < k :
                B.append( A[i] )    # if ele number < k , gets numbers to new list not comparing
            else:
                B[ind]=A[i]         # replace the smaller value with greater number in B           


    return B


A2 = [ 6, 13, -5, 9, -11, 3, 8, -12, 3, 1, -16 , 7 , 4, -8, 13, -21 ]
k = 3

print "The smallest %d elements in A" % k
print iterativelyFindKSmallest( A2 , k )

print " "
print " "


print "Question - 3-b - Sample Outputs #####################################"

# Question 3-b : This function returns a list whose first k elements are the k smallest elements in list A.
# This should be an recursive function .Function complexity must be O(n)

def recursivelyFindKSmallest( A , k ):
    
    # if the lenght of the A is k, return new list
    if   k >= len(A) :  
        return A
    else :
        # recursively calling until lenght of A is k
        return recursivelyFindKSmallest( A[ 0 : A.index( max(A) ) ] + A[ A.index( max(A) )+1 : len(A)  ] , k )    

k = 2
A3 = [ 6, 3, -5, 9, 11, 3 , 23, 1, 6 , 7 , 4,  13  ]
print "The smallest %d elements in A" % k

print recursivelyFindKSmallest( A3, k )

print " "
print " "



print "Question - 5-a - Sample Outputs #####################################"

#Question 5-a : Given a List A this function returns the start and end of an interval whose sum is the greatest among all other intervals in A.
#This should be a brute-force algorithm. If A=[-2,11,-4,13,-5,2]  your function should return 1 and 3 .
# Because the max interval is 11,-4,13 whose start and end indexes are 1 and 3 respectively.

def maxInterval(A):
    
    start=0
    end=len(A)-1
    maxVal = 0      # maxVal to compare summation of intervals and hold the max summation ; initial value to 0

    i = 0
    while i <= len(A)-1 :   # trace the list with two index as start and end to get sum of interval( start, end )
        j = i + 1           
        while j <= len(A) :
            if sum(A[i:(j+1)] ) > maxVal :  # and then compare all interval summation and get te maximum
                maxVal = sum(A[i:(j+1)] )   
                start  = i
                end    = j
            j = j + 1
        i = i + 1        
     
    # return the interval with greatest summation start and end indexes     
    return start,end

    
A4 = [-2,11,-4, 13,-5,2 ]
print "The start and end of an interval whose sum is the greatest among all other intervals in A  are [%d-%d]" % maxInterval( A4 )

print " "
print " "



print "Question - 6 - Sample Outputs #####################################"

#  Question 6 : There are n disks on the peg A.We want to trannsfer them to the peg C via peg B.
#  This function should have a similar output similar to the below one for n=3 and also should return the total number moves.
#  In this case should return 7. Function should be recursive
#  n is the number of disks. pegA pegB and pegC are the names of the pegs which are strings. In the example below "A" , "B" and "C" respectively.
#  Move top disk from peg A to peg C.
#  Move top disk from peg A to peg B.
#  Move top disk from peg C to peg B.
#  Move top disk from peg A to peg C.
#  Move top disk from peg B to peg A.
#  Move top disk from peg B to peg C.
#  Move top disk from peg A to peg C.

pegA="A"
pegC="B" 
pegB="C"
 
def hanoiTowers(n, pegA, pegB, pegC):
    numberOfMoves=0
    
    if n == 1:
        print "Move top disk from peg %s to pwg %s." % ( pegA, pegB )
        return 1
    else:
        return numberOfMoves + hanoiTowers( n-1, pegA, pegC, pegB ) + hanoiTowers( 1, pegA, pegB, pegC  )  + hanoiTowers( n-1, pegC, pegB, pegA )               
 
 
print "Number of moves to solve Hanoi -> %d" %  hanoiTowers( 2, pegA, pegB, pegC )

print " "
print " "     
    
    
    
    