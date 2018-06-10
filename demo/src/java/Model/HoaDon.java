/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.Date;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
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
    private String LoaiHD;
    @Temporal(TemporalType.TIMESTAMP)
    private Date Ngay;
    private String HinhThucTT;
    @OneToMany(mappedBy = "hd", fetch = FetchType.EAGER)
    List<CTHD> cthd;
    @ManyToOne
    @JoinColumn(name = "IDSP")
    private SanPham sp;
    
    public HoaDon() {
    }

    public HoaDon(String IDHD, String LoaiHD, Date Ngay, String HinhThucTT, List<CTHD> cthd, SanPham sp) {
        this.IDHD = IDHD;
        this.LoaiHD = LoaiHD;
        this.Ngay = Ngay;
        this.HinhThucTT = HinhThucTT;
        this.cthd = cthd;
        this.sp = sp;
    }

    public String getIDHD() {
        return IDHD;
    }

    public void setIDHD(String IDHD) {
        this.IDHD = IDHD;
    }

    public String getLoaiHD() {
        return LoaiHD;
    }

    public void setLoaiHD(String LoaiHD) {
        this.LoaiHD = LoaiHD;
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

    public SanPham getSp() {
        return sp;
    }

    public void setSp(SanPham sp) {
        this.sp = sp;
    }

    public List<CTHD> getCthd() {
        return cthd;
    }

    public void setCthd(List<CTHD> cthd) {
        this.cthd = cthd;
    }
    
}
