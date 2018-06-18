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
public class Kho {
    @Id
    @GeneratedValue
    private Integer STT;
    private String SL;
    private String Size;
    @ManyToOne
    @JoinColumn(name = "IDSP")
    private SanPham sp;

    public Kho() {
    }

    public Kho(Integer STT, String SL, String Size, SanPham sp) {
        this.STT = STT;
        this.SL = SL;
        this.Size = Size;
        this.sp = sp;
    }

    public Kho(String SL, String Size) {
        this.SL = SL;
        this.Size = Size;
    }
    
    
    public Integer getSTT() {
        return STT;
    }

    public void setSTT(Integer STT) {
        this.STT = STT;
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

    public SanPham getSp() {
        return sp;
    }

    public void setSp(SanPham sp) {
        this.sp = sp;
    }
    
}
