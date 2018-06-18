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
 * @author Visible
 */
@Entity
public class CTSP {
    @Id
    @GeneratedValue
    private Integer STT;
    private String motaCT;
    private String HinhCTSP;
    private String tieudeCTSP;
    @ManyToOne
    @JoinColumn(name = "IDSP")
    private SanPham sp;

    public CTSP() {
    }

    public CTSP(Integer STT, String motaCT, String HinhCTSP, SanPham sp) {
        this.STT = STT;
        this.motaCT = motaCT;
        this.HinhCTSP = HinhCTSP;
        this.sp = sp;
    }

    public CTSP(String motaCT, String HinhCTSP, String tieudeCTSP, SanPham sp) {
        this.motaCT = motaCT;
        this.HinhCTSP = HinhCTSP;
        this.tieudeCTSP = tieudeCTSP;
        this.sp = sp;
    }
    
    public CTSP(String motaCT, String HinhCTSP, SanPham sp) {
        this.motaCT = motaCT;
        this.HinhCTSP = HinhCTSP;
        this.sp = sp;
    }

    public Integer getSTT() {
        return STT;
    }

    public void setSTT(Integer STT) {
        this.STT = STT;
    }

    public String getMotaCT() {
        return motaCT;
    }

    public void setMotaCT(String motaCT) {
        this.motaCT = motaCT;
    }

    public String getHinhCTSP() {
        return HinhCTSP;
    }

    public void setHinhCTSP(String HinhCTSP) {
        this.HinhCTSP = HinhCTSP;
    }

    public SanPham getSp() {
        return sp;
    }

    public void setSp(SanPham sp) {
        this.sp = sp;
    }

    public String getTieudeCTSP() {
        return tieudeCTSP;
    }

    public void setTieudeCTSP(String tieudeCTSP) {
        this.tieudeCTSP = tieudeCTSP;
    }
    
}
