
import java.util.ArrayList;
import java.util.Random;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author m
 */
public class hw3 {

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
    public static ArrayList<Integer>[] heuristicSantaClaus(int[][] A) {

        return null;
    }

    
    //random mutluluk tablosu olusturuyor
    public static int[][] randomA(int numKids, int numToys) {
        Random randomGenerator = new Random();

        int A[][] = new int[numKids][numToys];

        for (int i = 0; i < numKids; i++) {

            for (int j = 0; j < numToys; j++) {

                A[i][j] = randomGenerator.nextInt(10) + 1;

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

    
    //cucuk sayısını 1000 den 10000 kadar 10 ar 10 ar artiriyor ve her bir cocuk sayisinda testi 100 kere uyguluyor
    //her bir cocuk sayisinda yüz testin ortalamasını hesaplayaıp averageTestTesults 'a yazıyor.
    public static ArrayList<Double> allTests() {

        ArrayList<Double> averageTestTesults = new ArrayList<Double>();

        for (int kids = 1000; kids <= 10000; kids += 10) {

            double all = 0;

            for (int numTest = 0; numTest < 100; numTest++) {
                int A[][] = randomA(kids, 100000);
                ArrayList<Integer>[] results;
                results = heuristicSantaClaus(A);
                int res = findTheLeastHappy(results);
                all += res;

            }
            averageTestTesults.add(all / 100);

        }

        return averageTestTesults;

    }

    
    //allTests değişkeninin sonuclarıyla grafik cizilecek.
    public static void main(String args[]) {

        ArrayList<Double> allTests = allTests();

    }

}
