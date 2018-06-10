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
    private String MoTaCT;
    private String HinhCTSP;
    @ManyToOne
    @JoinColumn(name = "IDSP")
    private SanPham sp;

    public CTSP() {
    }

    public CTSP(Integer STT, String MoTaCT, String HinhCTSP, SanPham sp) {
        this.STT = STT;
        this.MoTaCT = MoTaCT;
        this.HinhCTSP = HinhCTSP;
        this.sp = sp;
    }

    public Integer getSTT() {
        return STT;
    }

    public void setSTT(Integer STT) {
        this.STT = STT;
    }

    public String getMoTaCT() {
        return MoTaCT;
    }

    public void setMoTaCT(String MoTaCT) {
        this.MoTaCT = MoTaCT;
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
    
}
