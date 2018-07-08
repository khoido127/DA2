/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author Administrator
 */
@Entity
public class HoaDon {
    @Id 
    private String IDHD;
    @Temporal(TemporalType.TIMESTAMP)
    private Date Ngay;
    private String HinhThucTT;
    private String loaiHD;
    private String TenSP;
    private String IDSP;
    private String SL;
    private String Size;
    private String Gia;
    private String TenKH;
    private String SDT;
    private String diaChi;
    private String Email;
    private String trangThai;
    private Double tongTien;
    public HoaDon() {
    }

    public HoaDon(String IDHD, Date Ngay, String HinhThucTT, String loaiHD, String TenSP, String IDSP, String SL, String Size, String Gia, String TenKH, String SDT, String diaChi, String Email, String trangThai, Double tongTien) {
        this.IDHD = IDHD;
        this.Ngay = Ngay;
        this.HinhThucTT = HinhThucTT;
        this.loaiHD = loaiHD;
        this.TenSP = TenSP;
        this.IDSP = IDSP;
        this.SL = SL;
        this.Size = Size;
        this.Gia = Gia;
        this.TenKH = TenKH;
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
        return Ngay;
    }

    public void setNgay(Date Ngay) {
        this.Ngay = Ngay;
    }

    public String getHinhThucTT() {
        return HinhThucTT;
    }

    public void setHinhThucTT(String HinhThucTT) {
        this.HinhThucTT = HinhThucTT;
    }

    public String getTenSP() {
        return TenSP;
    }

    public void setTenSP(String TenSP) {
        this.TenSP = TenSP;
    }

    public String getIDSP() {
        return IDSP;
    }

    public void setIDSP(String IDSP) {
        this.IDSP = IDSP;
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
        return TenKH;
    }

    public void setTenKH(String TenKH) {
        this.TenKH = TenKH;
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
