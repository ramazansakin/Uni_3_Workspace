
    ######################################################
   ########################################    HOMEWORK-4
  #########################    Ramazan Sakin - 111044069
 ##################    Introduction to Algorithm Design
######################################################

#hw4 quest 1

# decrease the string and conquare them
def numOfString( n ):
    
    # string lenght is 1
    if  n == 1:
        return 2
    # string lenght is 2    
    elif n == 2:
        return 3
    else:
        # decrease the string
        return numOfString( n-1 ) + numOfString(n-2)


print "Question - 1 - Sample Outputs #####################################"
k = 6
print "different string number that can be written with order ", k
print numOfString( k )


#hw4 quest 2
# tuglalar 2*1 yan ve ya dik gelebilir ve ya tekli 1*1 lik tuglalardan olusabilir.

def wall( n ):
    
    if n == 1:
        return  2
    else:
        # decrease the lenght of wall and conquer and add to 2 * brick number and decrease by 1 
        return  2*wall(n-1) + 2*n - 1     

k = 4
print "Question - 2 - Sample Outputs #####################################"
print k, " brick number can be used"
print wall( k )

# a list
A = [ 34, 25 ,18, 21, 17, 95, 15, 378, 38, 49, 39, 14, 19 ]


# this is same as wrapper funtion in order to send 0 and len(A) -1 to helper for recursion
def find2people( A ):

    return find2PeopleHelper( A, 0, len(A)-1 )


# compare all people in the list A and returns the closest 2 people
def  comparePeople( A, start, mean, end ):

    # set value to infinity to compare
    diff = float("inf")

    # if the lenght of list has at leaset 3 elememt
    if len(A) > 2:
        for i in range( start, end +1,1) :
            for j in range( i+1, end +1,1) :
                # get the closest one after comparing
                if abs( A[i] - A[j] ) < diff :
                    diff = abs( A[i] - A[j] )
                    ind1 = i
                    ind2 = j
            
        # return the closest people
        return A[ind1], A[ind2]
    else :
        return A[start], A[end]                



# helper recursive function to find 2 closest people 
# divide and conquer method
def find2PeopleHelper(A,start, end):

    if abs(start - end) <= 2:
        return A[start], A[end]
    else :
        mean =  ( start + end ) // 2
        
        # gets nearest pairs and compare them 
        left1, right1 = find2PeopleHelper( A, start, mean )
        left2, right2 = find2PeopleHelper( A, mean+1, end )

        left3, right3 = comparePeople( A, start, mean, end )

        # get the closest 2 people
        if abs(left1 - right1) <= abs(left2 - right2) & abs(left1 - right1) <= abs(left3 - right3) :
            return ( left1, right1 )
        elif abs(left2 - right2) <= abs(left1 - right1) & abs(left2 - right2) <= abs(left3 - right3):
            return ( left2, right2 )
        else:
            return ( left3, right3 )

print "Question - 3 - Sample Outputs #####################################"
print "The closest people of list A is "
print find2people(A)


# hw4 quest . A bir liste.
# this is same as wrapper funtion in order to send 0 and len(A) -1 to helper for recursion
def maxInterval( A ):

    return  maxIntervalHelper(A, 0, len(A)-1)



B = [ -2, 11, -4, 13, -5, -4, 10 ]

# summation of the sub array of a list
def sumOfSubArray( A, left, mean,  right ):
        # variables
        Summ = 0
        i = mean
        Max_Sum_left = 0
        # set a var to infinity to compare with sum of numbers betw. left and mean
        left_Summ = float("-inf")
        # get sum of numbers betw. left and mean
        for i in range (mean, left, -1):
            Summ = Summ + A[i]
            # compare and get the biggest one
            if Summ > left_Summ:
                left_Summ = Summ
                Max_Sum_left = i

        Summ = 0
        j = mean + 1
        MAx_Sum_Right = 0
        # set a var to infinity to compare with sum of numbers betw. right and mean
        right_Summ = float("-inf")
        # get sum of numbers betw. right and mean
        for j in range (mean + 1, right+1):
            Summ = Summ + A[j]
            # compare and get the biggest one
            if Summ > right_Summ:
                right_Summ = Summ
                MAx_Sum_Right = j

        return (Max_Sum_left, MAx_Sum_Right, left_Summ + right_Summ)


# helper function to get indexes left and right
def maxIntervalHelper(A, left , right  ):
        
        # if the len(A) is 1 , returns A[0], right and left indexes( equal )
        # base case
        if right == left:
            return (left, right, A[left])
        else:
            # else divide and conquer case :
            # divide the list two part from mean and recursivly conquer them
            mean = (left + right) // 2
            # get indexes and total
            l_left_ind, l_right_ind, l_summ = maxIntervalHelper(A, left, mean)
            r_left_ind, r_right_ind, r_summ = maxIntervalHelper(A, mean + 1, right)
            total_left_ind, total_right_ind, total_summ = sumOfSubArray(A, left, mean,  right)
            
            # choose the biggest one of sub array sum and its indexes
            if l_summ >= r_summ & l_summ >= total_summ:
                return (l_left_ind, l_right_ind, l_summ)
            elif r_summ >= l_summ & r_summ >= total_summ:
                return (r_left_ind, r_right_ind, r_summ)
            else:
                return (total_left_ind, total_right_ind, total_summ)


print "Question - 4 - Sample Outputs #####################################"
print "Max interval result of list B is "
print maxInterval( B )



# bonus : This function returns a list whose first k elements are the k smallest elements in list A.
# This should be an recursive function .Function complexity must be O(n). 
# decrease and conqur metodu ile cozunuz.

 
def recursivelyFindKSmallest( A , k ):
    
    # if the lenght of the A is k, return new list
    if   k >= len(A) :
        return A
    else :
        # recursively calling until lenght of A is k
        return  recursivelyFindKSmallest( A[ 0 : A.index( max(A) ) ] + A[ A.index( max(A) )+1 : len(A)  ] , k )
    
print "Question - bonus - Sample Outputs #####################################"
k = 3
print "The smallest %d elements in list A" % k
print recursivelyFindKSmallest( A , k )


