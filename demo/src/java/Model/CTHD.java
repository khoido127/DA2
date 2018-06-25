/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

/**
 *
 * @author Administrator
 */
@Entity
public class CTHD {
    @Id 
    @GeneratedValue
    private Integer STT;
    private String TenSP;
    private Integer SL;
    private String Size;
    private Double Gia;
    private String TenKH;
    private String SDT;
    private String diaChi;
    private String Email;
    @ManyToOne
    @JoinColumn(name = "IDSP")
    private SanPham sp;
    @ManyToOne
    @JoinColumn(name = "IDHD")
    private HoaDon hd;
    public CTHD() {
    }

    public CTHD(Integer STT, String TenSP, Integer SL, String Size, Double Gia, String TenKH, String SDT, String diaChi, String Email, HoaDon hd) {
        this.STT = STT;
        this.TenSP = TenSP;
        this.SL = SL;
        this.Size = Size;
        this.Gia = Gia;
        this.TenKH = TenKH;
        this.SDT = SDT;
        this.diaChi = diaChi;
        this.Email = Email;
        this.hd = hd;
    }
    
    public Integer getSTT() {
        return STT;
    }

    public void setSTT(Integer STT) {
        this.STT = STT;
    }

    public String getTenSP() {
        return TenSP;
    }

    public void setTenSP(String TenSP) {
        this.TenSP = TenSP;
    }

    public Integer getSL() {
        return SL;
    }

    public void setSL(Integer SL) {
        this.SL = SL;
    }

    public String getSize() {
        return Size;
    }

    public void setSize(String Size) {
        this.Size = Size;
    }

    public Double getGia() {
        return Gia;
    }

    public void setGia(Double Gia) {
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

    public HoaDon getHd() {
        return hd;
    }

    public void setHd(HoaDon hd) {
        this.hd = hd;
    }
    
}
