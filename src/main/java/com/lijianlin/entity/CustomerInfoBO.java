package com.lijianlin.entity;

public class CustomerInfoBO {
    Integer Cid;
    String Cnam;
    String Cadd;
    String Cpeo;
    String Ctel;
    String Cmai;

    public CustomerInfoBO(Integer cid, String cnam, String cadd, String cpeo, String ctel, String cmai) {
        Cid = cid;
        Cnam = cnam;
        Cadd = cadd;
        Cpeo = cpeo;
        Ctel = ctel;
        Cmai = cmai;
    }

    public Integer getCid() {
        return Cid;
    }

    public void setCid(Integer cid) {
        Cid = cid;
    }

    public String getCnam() {
        return Cnam;
    }

    public void setCnam(String cnam) {
        Cnam = cnam;
    }

    public String getCadd() {
        return Cadd;
    }

    public void setCadd(String cadd) {
        Cadd = cadd;
    }

    public String getCpeo() {
        return Cpeo;
    }

    public void setCpeo(String cpeo) {
        Cpeo = cpeo;
    }

    public String getCtel() {
        return Ctel;
    }

    public void setCtel(String ctel) {
        Ctel = ctel;
    }

    public String getCmai() {
        return Cmai;
    }

    public void setCmai(String cmai) {
        Cmai = cmai;
    }

    @Override
    public String toString() {
        return "CustomerInfoBO{" +
                "Cid=" + Cid +
                ", Cnam='" + Cnam + '\'' +
                ", Cadd='" + Cadd + '\'' +
                ", Cpeo='" + Cpeo + '\'' +
                ", Ctel='" + Ctel + '\'' +
                ", Cmai='" + Cmai + '\'' +
                '}';
    }
}
