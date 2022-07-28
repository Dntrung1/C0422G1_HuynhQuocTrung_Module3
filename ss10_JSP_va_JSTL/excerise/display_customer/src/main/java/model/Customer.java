package model;

import java.time.LocalDate;
import java.util.Date;

public class Customer {
    private String name;
    private LocalDate birhday;
    private String address;
    private String link;

    public Customer() {
    }

    public Customer(String name, LocalDate birhday, String address, String link) {
        this.name = name;
        this.birhday = birhday;
        this.address = address;
        this.link = link;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public LocalDate getBirhday() {
        return birhday;
    }

    public void setBirhday(LocalDate birhday) {
        this.birhday = birhday;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }
}
