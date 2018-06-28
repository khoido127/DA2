/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class GioHang {

    private String IDSP;
    private String hinhSP;
    private String tenSP;
    private double giaSP;
    private int soluong;
    private double tongtien;
    private String idLoai;
    private double giaGoc;
    private String size;
    public static List<GioHang> gh = new ArrayList<>();

    public GioHang() {
    }

    public GioHang(String IDSP, String hinhSP, String tenSP, double giaSP, int soluong, double tongtien) {
        this.IDSP = IDSP;
        this.hinhSP = hinhSP;
        this.tenSP = tenSP;
        this.giaSP = giaSP;
        this.soluong = soluong;
        this.tongtien = tongtien;
    }

    public GioHang(String IDSP, String hinhSP, String tenSP, double giaSP, int soluong, double tongtien, String idLoai, String size) {
        this.IDSP = IDSP;
        this.hinhSP = hinhSP;
        this.tenSP = tenSP;
        this.giaSP = giaSP;
        this.soluong = soluong;
        this.tongtien = tongtien;
        this.idLoai = idLoai;
        this.size = size;
    }

    public GioHang(String IDSP, String hinhSP, String tenSP, double giaSP, int soluong, double tongtien, String idLoai, double giaGoc, String size) {
        this.IDSP = IDSP;
        this.hinhSP = hinhSP;
        this.tenSP = tenSP;
        this.giaSP = giaSP;
        this.soluong = soluong;
        this.tongtien = tongtien;
        this.idLoai = idLoai;
        this.giaGoc = giaGoc;
        this.size = size;
    }

    public String getIDSP() {
        return IDSP;
    }

    public void setIDSP(String IDSP) {
        this.IDSP = IDSP;
    }

    public String getTenSP() {
        return tenSP;
    }

    public void setTenSP(String tenSP) {
        this.tenSP = tenSP;
    }

    public double getGiaSP() {
        return giaSP;
    }

    public void setGiaSP(double giaSP) {
        this.giaSP = giaSP;
    }

    public int getSoluong() {
        return soluong;
    }

    public void setSoluong(int soluong) {
        this.soluong = soluong;
    }

    public double getTongtien() {
        return tongtien;
    }

    public void setTongtien(double tongtien) {
        this.tongtien = tongtien;
    }

    public String getHinhSP() {
        return hinhSP;
    }

    public void setHinhSP(String hinhSP) {
        this.hinhSP = hinhSP;
    }

    public static List<GioHang> getGh() {
        return gh;
    }

    public static void setGh(List<GioHang> gh) {
        GioHang.gh = gh;
    }

    public String getIdLoai() {
        return idLoai;
    }

    public void setIdLoai(String idLoai) {
        this.idLoai = idLoai;
    }

    public double getGiaGoc() {
        return giaGoc;
    }

    public void setGiaGoc(double giaGoc) {
        this.giaGoc = giaGoc;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }
    
}
