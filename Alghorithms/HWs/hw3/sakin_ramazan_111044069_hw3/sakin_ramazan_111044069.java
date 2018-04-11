
import java.util.ArrayList;
import java.util.Random;
/**
 *
 * @author Rmzn Skn
 */
public class sakin_ramazan_111044069 {

    /**
     *
     * The function that you need to implement in your program takes an mXn
     * double array A , where A[i][j] is the happiness of kid i when toy j is
     * given
     *
     * This fuction returns an Array of ArrayLists B such that B[k] is an
     * arraylist whose elemnets are the k'th kids toys.
     *
     */
    public static ArrayList<Integer>[]  heuristicSantaClaus( int[][] A ) {

        @SuppressWarnings("unchecked")
        ArrayList<Integer>[]  B = new ArrayList[A.length];
        
        for (int i = 0; i <  A.length ; i++) 
            B[i] = new ArrayList<>();
        
        for (int i = 0; i <  A.length ; i++)    
            B[i].add(0);
            
        for (int i = 0; i <  A.length ; i++) {
            for (int j = i+1; j <  A[0].length ; j++) {
                
                if( A[i][j] != 0 ){
                    // En mutsuz cocuk bulunarak ona kalan hediyelerden birini vererek daha mutlu
                    // ediliyor.
                    int a = findTHeLeastHappyInd(B);
                    B[a].add(A[i][j]);
                    // Hediye verildikten sonra yerine sıfır koyularak baska bir cocuga
                    // gitmemesi saglanıyor.
                    A[i][j] = 0;
                }
            }
        }

        return B;
    }
    
    public static int findTHeLeastHappyInd( ArrayList<Integer>[] A  ){
        
        int leastHappy = 0;
        int ind = 0;
        for (Integer integer : A[0]) {
            leastHappy += integer;

        }
        
        int count = 0;

        for (ArrayList<Integer> arrayList : A) {
            int total = 0;
            for (Integer integer : arrayList) {
                total += integer;

            }
            count ++;

            if (total < leastHappy) {
                leastHappy = total;
                ind = count;
            }

        }

        return ind;
        
        
    }

    
    //random mutluluk tablosu olusturuyor
    public static int[][] randomA(int numKids, int numToys) {
        Random randomGenerator = new Random();

        int A[][] = new int[numKids][numToys];

        for (int i = 0; i < numKids; i++) {

            for (int j = 0; j < numToys; j++) {

                A[i][j] = randomGenerator.nextInt(10) + 1;

                System.out.println("A["+i+"]["+j+"] = " +A[i][j] );
            }

        }

        return A;
    }

    //verilen bir oyuncak dagiliminda en mutsuzu buluyor.
    public static int findTheLeastHappy(ArrayList<Integer>[] results) {

        int leastHappy = 0;
        for (Integer integer : results[0]) {
            leastHappy += integer;

        }

        for (ArrayList<Integer> arrayList : results) {
            int total = 0;
            for (Integer integer : arrayList) {
                total += integer;

            }

            if (total < leastHappy) {
                leastHappy = total;

            }

        }

        return leastHappy;
    }

    
    //cucuk sayısını 1000 den 10000 kadar 10 ar 10 ar artiriyor ve
    //her bir cocuk sayisinda testi 100 kere uyguluyor
    //her bir cocuk sayisinda yüz testin ortalamasını hesaplayaıp averageTestTesults 'a yazıyor.
    public static ArrayList<Double> allTests() {

        ArrayList<Double> averageTestTesults = new ArrayList<Double>();

        for (int kids = 10; kids <= 100; kids += 10) {

            double all = 0;

            for (int numTest = 0; numTest < 10; numTest++) {
                int A[][] = randomA(kids, 100);
                ArrayList<Integer>[] results;
                results = heuristicSantaClaus(A);
                int res = findTheLeastHappy(results);
                all += res;

            }
            averageTestTesults.add(all / 10);

        }

        return averageTestTesults;

    }

    
    //allTests değişkeninin sonuclarıyla grafik cizilecek.
    public static void main(String args[]) {

        ArrayList<Double> allTests = allTests();
        
        for (int i = 0; i < allTests.size() ; i++) {
            System.out.println("Sonuclar = " +allTests.get(i));
        }
        
    }

}

