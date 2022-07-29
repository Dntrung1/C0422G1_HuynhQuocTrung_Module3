package service.impl;

import model.Caculator;
import service.IService;

public class CaculateService implements IService {
    Caculator caculator = new Caculator();
    @Override
    public String tinh(double first, double second, String dau) {
        String result = "";
        switch (dau){
            case "+":
                result += caculator.cong(first,second);
                break;
            case "-":
                result +=caculator.tru(first,second);
                break;
            case "*":
                result +=caculator.nhan(first,second);
                break;
            case "/":
                if (second== 0){
                    result += "Khi chia sô thứ 2 khong được bằng không";
                }else {
                    result +=caculator.chia(first, second);
                }
                break;
        }
        return result;
    }
}
