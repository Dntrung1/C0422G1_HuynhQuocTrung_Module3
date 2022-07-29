package model;

public class Caculator {
    double first;
    double second;

    public Caculator() {
    }

    public Caculator(double first, double second) {
        this.first = first;
        this.second = second;
    }

    public double getFirst() {
        return first;
    }

    public void setFirst(double first) {
        this.first = first;
    }

    public double getSecond() {
        return second;
    }

    public void setSecond(double second) {
        this.second = second;
    }

    public String cong(double first, double second){
       String result = Double.toString(first+second);
       return result;
    }

    public String tru(double first, double second){
        String result = Double.toString(first-second);
        return result;
    }

    public String nhan(double first, double second){
        String result = Double.toString(first*second);
        return result;
    }
    public String chia(double first, double second){
        String result = Double.toString(first/second);
        return result;
    }
}
