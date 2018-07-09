/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author Administrator
 */
@Entity
public class HoaDon implements Serializable{
    @Id 
    private String IDHD;
    @Temporal(TemporalType.TIMESTAMP)
    private Date ngay;
    private String hinhThucTT;
    private String loaiHD;
    private String tenSP;
    private String idSP;
    private String SL;
    private String Size;
    private String Gia;
    private String tenKH;
    private String SDT;
    private String diaChi;
    private String Email;
    private String trangThai;
    private Double tongTien;
    public HoaDon() {
    }

    public HoaDon(String IDHD, Date ngay, String hinhThucTT, String loaiHD, String tenSP, String IDSP, String SL, String Size, String Gia, String tenKH, String SDT, String diaChi, String Email, String trangThai, Double tongTien) {
        this.IDHD = IDHD;
        this.ngay = ngay;
        this.hinhThucTT = hinhThucTT;
        this.loaiHD = loaiHD;
        this.tenSP = tenSP;
        this.idSP = IDSP;
        this.SL = SL;
        this.Size = Size;
        this.Gia = Gia;
        this.tenKH = tenKH;
        this.SDT = SDT;
        this.diaChi = diaChi;
        this.Email = Email;
        this.trangThai = trangThai;
        this.tongTien = tongTien;
    }
    
    public String getIDHD() {
        return IDHD;
    }

    public void setIDHD(String IDHD) {
        this.IDHD = IDHD;
    }

    public Date getNgay() {
        return ngay;
    }

    public void setNgay(Date ngay) {
        this.ngay = ngay;
    }

    public String getHinhThucTT() {
        return hinhThucTT;
    }

    public void setHinhThucTT(String hinhThucTT) {
        this.hinhThucTT = hinhThucTT;
    }

    public String getTenSP() {
        return tenSP;
    }

    public void setTenSP(String tenSP) {
        this.tenSP = tenSP;
    }

    public String getIdSP() {
        return idSP;
    }

    public void setIdSP(String idSP) {
        this.idSP = idSP;
    }
    
    public String getSL() {
        return SL;
    }

    public void setSL(String SL) {
        this.SL = SL;
    }

    public String getSize() {
        return Size;
    }

    public void setSize(String Size) {
        this.Size = Size;
    }

    public String getGia() {
        return Gia;
    }

    public void setGia(String Gia) {
        this.Gia = Gia;
    }

    public String getTenKH() {
        return tenKH;
    }

    public void setTenKH(String tenKH) {
        this.tenKH = tenKH;
    }
    
    public String getSDT() {
        return SDT;
    }

    public void setSDT(String SDT) {
        this.SDT = SDT;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }

    public String getLoaiHD() {
        return loaiHD;
    }

    public void setLoaiHD(String loaiHD) {
        this.loaiHD = loaiHD;
    }

    public Double getTongTien() {
        return tongTien;
    }

    public void setTongTien(Double tongTien) {
        this.tongTien = tongTien;
    }
    
}
