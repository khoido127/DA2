/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

/**
 *
 * @author Visible
 */
@Entity
public class SanPham implements Serializable{
    @Id
    private String IDSP;
    private String TenSP;
    private Double GiaSPKM;
    private Double GiaSP;
    private String isHot;
    private String MoTa;
    private String HinhSP;
    @OneToMany(mappedBy = "sp", fetch = FetchType.EAGER)
    List<CTSP> ctsp;
    @OneToMany(mappedBy = "sp", fetch = FetchType.EAGER)
    List<CTHD> cthd;
    @OneToMany(mappedBy = "sp", fetch = FetchType.EAGER)
    List<Comment> commnent;
    @OneToMany(mappedBy = "sp", fetch = FetchType.EAGER)
    List<Kho> kho;
    @ManyToOne
    @JoinColumn(name = "IDLoai")
    private Loai loai;
    public SanPham() {
    }

    public SanPham(String IDSP, String TenSP, Double GiaSPKM, Double GiaSP, String isHot, String MoTa, String HinhSP, List<CTSP> ctsp, List<CTHD> cthd, List<Comment> commnent, List<Kho> kho, Loai loai) {
        this.IDSP = IDSP;
        this.TenSP = TenSP;
        this.GiaSPKM = GiaSPKM;
        this.GiaSP = GiaSP;
        this.isHot = isHot;
        this.MoTa = MoTa;
        this.HinhSP = HinhSP;
        this.ctsp = ctsp;
        this.cthd = cthd;
        this.commnent = commnent;
        this.kho = kho;
        this.loai = loai;
    }
    
    public SanPham(String IDSP, String TenSP, Double GiaSPKM, Double GiaSP, String MoTa, String HinhSP, Loai loai) {
        this.IDSP = IDSP;
        this.TenSP = TenSP;
        this.GiaSPKM = GiaSPKM;
        this.GiaSP = GiaSP;
        this.MoTa = MoTa;
        this.HinhSP = HinhSP;
        this.loai = loai;
    }
    
    
    public String getIDSP() {
        return IDSP;
    }

    public void setIDSP(String IDSP) {
        this.IDSP = IDSP;
    }

    public String getTenSP() {
        return TenSP;
    }

    public void setTenSP(String TenSP) {
        this.TenSP = TenSP;
    }

    public Double getGiaSPKM() {
        return GiaSPKM;
    }

    public void setGiaSPKM(Double GiaSPKM) {
        this.GiaSPKM = GiaSPKM;
    }

    public Double getGiaSP() {
        return GiaSP;
    }

    public void setGiaSP(Double GiaSP) {
        this.GiaSP = GiaSP;
    }

    
    public String getIsHot() {
        return isHot;
    }

    public void setIsHot(String isHot) {
        this.isHot = isHot;
    }

    public String getMoTa() {
        return MoTa;
    }

    public void setMoTa(String MoTa) {
        this.MoTa = MoTa;
    }

    public String getHinhSP() {
        return HinhSP;
    }

    public void setHinhSP(String HinhSP) {
        this.HinhSP = HinhSP;
    }

    public List<CTSP> getCtsp() {
        return ctsp;
    }

    public void setCtsp(List<CTSP> ctsp) {
        this.ctsp = ctsp;
    }

    public List<Comment> getCommnent() {
        return commnent;
    }

    public void setCommnent(List<Comment> commnent) {
        this.commnent = commnent;
    }

    public Loai getLoai() {
        return loai;
    }

    public void setLoai(Loai loai) {
        this.loai = loai;
    }

    public List<CTHD> getCthd() {
        return cthd;
    }

    public void setCthd(List<CTHD> cthd) {
        this.cthd = cthd;
    }
    
    public List<Kho> getKho() {
        return kho;
    }

    public void setKho(List<Kho> kho) {
        this.kho = kho;
    }
    
}
