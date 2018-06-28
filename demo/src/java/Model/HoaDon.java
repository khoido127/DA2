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
    @Temporal(TemporalType.TIMESTAMP)
    private Date Ngay;
    private String HinhThucTT;
    @OneToMany(mappedBy = "hd", fetch = FetchType.EAGER)
    List<CTHD> cthd;
    
    
    public HoaDon() {
    }

    public HoaDon(String IDHD, Date Ngay, String HinhThucTT, List<CTHD> cthd) {
        this.IDHD = IDHD;
        this.Ngay = Ngay;
        this.HinhThucTT = HinhThucTT;
        this.cthd = cthd;
        
    }

    public HoaDon(String IDHD, Date Ngay, String HinhThucTT) {
        this.IDHD = IDHD;
        this.Ngay = Ngay;
        this.HinhThucTT = HinhThucTT;
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

    public List<CTHD> getCthd() {
        return cthd;
    }

    public void setCthd(List<CTHD> cthd) {
        this.cthd = cthd;
    }
    
}
