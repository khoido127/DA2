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
    private Integer SL;
    private String Size;
    @ManyToOne
    @JoinColumn(name = "IDSP")
    private SanPham sp;

    public Kho() {
    }

    public Kho(Integer STT, Integer SL, String Size, SanPham sp) {
        this.STT = STT;
        this.SL = SL;
        this.Size = Size;
        this.sp = sp;
    }

    public Integer getSTT() {
        return STT;
    }

    public void setSTT(Integer STT) {
        this.STT = STT;
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

    public SanPham getSp() {
        return sp;
    }

    public void setSp(SanPham sp) {
        this.sp = sp;
    }
    
}
