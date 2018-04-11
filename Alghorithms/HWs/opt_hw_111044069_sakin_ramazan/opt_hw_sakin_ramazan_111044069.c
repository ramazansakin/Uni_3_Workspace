
    //////////////////////////////////////////////////////
   ////////////////////////////////////////    HOMEWORK-2
  ////////////////////////    Ramazan Sakin - 111044069
 ////////////////    Design and Analsys of Algorithms
////////////////////////////////////////////////////

#include <stdio.h>
#include <time.h>
#include <stdlib.h>


const int MAX_VER_NUM = 1000;
static 	int numOfNodes =50;

int**  minimumMaximalMatch( int  A[][MAX_VER_NUM] , int n );
void generateRandNetToplgy( int A[][MAX_VER_NUM] , int vN, int eN );
void test1();
void test2();
void printMat( int A[][MAX_VER_NUM], int n );
int  getLeastAdjInd( int a[], int n );
int  findEdgeNum( int B[][MAX_VER_NUM], int numOfNodes );


int main(int argc, char const *argv[])
{
	// to get random values
	srand(time(NULL));

	// Test -- 1
	test1();

	// Test -- 2
	test2();

	
	return 0;
} 


// -->> test1 : generate 100 random network topologies with node degree of 4 and the number of nodes varying from 50 to 1000.
void test1(){

	
	int i, j;
	int A[MAX_VER_NUM][MAX_VER_NUM];
	int** B;
	int numOfNOdes;
	int edgeNum =0;

	printf("TEST 1------------------------------------\n");
	for ( i = 0; i < 100; ++i){	
		// random generating number
		numOfNodes = rand()%951+50;
		numOfNOdes=(numOfNodes/3)*2;
		generateRandNetToplgy( A, numOfNodes, 4 );
		B = minimumMaximalMatch( A, numOfNodes );

		printf("%d;%d;%d\n", numOfNodes,findEdgeNum(A, numOfNodes), findEdgeNum(B, numOfNOdes ) );
		
		edgeNum += findEdgeNum(B, numOfNOdes );
	}	

	printf("Ortalama node sayısı = %d\n", edgeNum/100 );

}


// -->> test2 : generates 100 random network topologies with 500 nodes and vary the node degree parameter in the range from 4 to 10
void test2( ){	

	int A[MAX_VER_NUM][MAX_VER_NUM];
	int numOfNOdes=200, i, j, eN=0;
	int** B, edgeNum=0;
	

	printf("TEST 2------------------------------------\n");
	for ( i = 0; i < 100; ++i){	

		generateRandNetToplgy( A, 500, eN );
		B = minimumMaximalMatch( A, 500 );
		printf("%d;%d;%d\n", 500 , findEdgeNum(A, numOfNodes ), findEdgeNum(B, numOfNOdes ) );
		
		edgeNum += findEdgeNum(B, numOfNOdes );
	}

	printf("Ortalama node sayısı = %d\n", edgeNum/100 );

}



// İstenilen node sayısı aralıgında ve  edge sayısında test1 ve test2 icin 
// network topology leri olusturur.
// Test1 icin 
//generate 100 random network topologies with node degree of 4 and the number of nodes varying from 50 to 1000.

// test2 icin :
// generate 100 random network topologies with 500 nodes and vary the node degree parameter in the range from 4 to 10
void generateRandNetToplgy( int A[][MAX_VER_NUM] , int vN, int eN ){

	int  j, r, t1=0, t2=0 ,i;
	
	if( eN == 4 )
		r = 4;	
	else
		r = rand()%7+4;
	
	for( i=0; i<vN; ++i )
		for ( j = 0; j < r; ++j){

			t2 = rand() % vN;
			A[i][t2] = 1;
		}
}



// A is the 2 dimensional array that represents the graph
// n is number of nodes of the graph
// graphta ust triangle matris ile alt triangle matris birbirinin simetrigi oldugundan
// sadece ust tarafı kullanılabilir.
int**  minimumMaximalMatch( int A[][MAX_VER_NUM] , int n ){

	int i;
	int adjNodes[n];
	int adjEdge;
	int num=0,t, prev;
	int count, randVer;

	// vertex lere ikişerli bakıldıgı için n/2 tane bakmak yeterli olur.
	for( i=0; i<n/2; ++i ){

		randVer = rand()%n;	// get a vertex randomly
		// vertexin komsularına bakılır.
		for ( i = 0; i < n; ++i){
			// komsu vertex bulununca geri kalanlar sıfırlanır
			if( A[randVer][i] == 1 ){
				// ilk komsu bulunduktan sonra diğer komsu vertexler silinir.
				for ( t = i+1; t < n; ++t )
					A[randVer][i] = 0;

			}
		}
	}
	// min maximal matching matrix döndürülür.
	return A;
}


// prints the matrix to show addjacency of matrixes
// network topology adjacncy relation
void printMat( int A[][MAX_VER_NUM], int n ){

	int  i , j;

	for ( i = 0; i < n; ++i){
		for ( j = 0; j < n; ++j )
			printf("%d - ", A[i][j]);
		
		printf("\n");
	}
}


// finds edge number for calculating matching node number and
// determine the required  maximum edge.
int findEdgeNum( int B[][MAX_VER_NUM], int numOfNodes ){

	int i , j , num=0;

	for (i = 0; i < numOfNodes; ++i){
		for ( j = 0; j  < numOfNodes; ++j){
			if (B[i][j] == 1)
				++num;
		}
	}

	return num;
}

