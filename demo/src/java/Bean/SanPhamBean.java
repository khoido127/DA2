/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

/**
 *
 * @author Visible
 */
public class SanPhamBean {

    private String IDSP;
    private String TenSP;
    private String GiaSPKM;
    private double GiaSP;
    private String isHot;
    private String moTa;
    private String HinhSP;
    private String IDLoai;
    private String saveMoney;

    public SanPhamBean() {
    }

    public SanPhamBean(String IDSP, String TenSP, String GiaSPKM, double GiaSP, String isHot, String MoTa, String HinhSP, String Loai) {
        this.IDSP = IDSP;
        this.TenSP = TenSP;
        this.GiaSPKM = GiaSPKM;
        this.GiaSP = GiaSP;
        this.isHot = isHot;
        this.moTa = MoTa;
        this.HinhSP = HinhSP;
        this.IDLoai = Loai;
    }

    public SanPhamBean(String IDSP, String TenSP, double GiaSP, String HinhSP, String loai, String mota, String saveMoney, String GiaSPKM) {
        this.IDSP = IDSP;
        this.TenSP = TenSP;
        this.GiaSP = GiaSP;
        this.HinhSP = HinhSP;
        this.IDLoai = loai;
        this.moTa = mota;
        this.saveMoney = saveMoney;
        this.GiaSPKM = GiaSPKM;
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

    public String getGiaSPKM() {
        return GiaSPKM;
    }

    public void setGiaSPKM(String GiaSPKM) {
        this.GiaSPKM = GiaSPKM;
    }

    public double getGiaSP() {
        return GiaSP;
    }

    public void setGiaSP(double GiaSP) {
        this.GiaSP = GiaSP;
    }
    

    public String getIsHot() {
        return isHot;
    }

    public void setIsHot(String isHot) {
        this.isHot = isHot;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public String getHinhSP() {
        return HinhSP;
    }

    public void setHinhSP(String HinhSP) {
        this.HinhSP = HinhSP;
    }

    public String getIDLoai() {
        return IDLoai;
    }

    public void setIDLoai(String IDLoai) {
        this.IDLoai = IDLoai;
    }

    public String getSaveMoney() {
        return saveMoney;
    }

    public void setSaveMoney(String saveMoney) {
        this.saveMoney = saveMoney;
    }

}
