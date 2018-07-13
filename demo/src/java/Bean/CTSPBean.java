/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

/**
 *
 * @author ASUS
 */
public class CTSPBean {

    private String IDSP;
    private String idLoai;
    private String motaCT;
    private String hinhCTSP;
    private String tieudeCTSP;
    private String tenHinh;

    public CTSPBean() {
    }

    public CTSPBean(String IDSP, String idLoai, String motaCT, String hinhCTSP, String tieudeCTSP, String tenHinh) {
        this.IDSP = IDSP;
        this.idLoai = idLoai;
        this.motaCT = motaCT;
        this.hinhCTSP = hinhCTSP;
        this.tieudeCTSP = tieudeCTSP;
        this.tenHinh = tenHinh;
    }

    public CTSPBean(String motaCT, String hinhCTSP, String tieudeCTSP) {
        this.motaCT = motaCT;
        this.hinhCTSP = hinhCTSP;
        this.tieudeCTSP = tieudeCTSP;
    }

    public CTSPBean(String IDSP, String motaCT, String hinhCTSP, String tieudeCTSP) {
        this.IDSP = IDSP;
        this.motaCT = motaCT;
        this.hinhCTSP = hinhCTSP;
        this.tieudeCTSP = tieudeCTSP;
    }

    public String getMotaCT() {
        return motaCT;
    }

    public void setMotaCT(String motaCT) {
        this.motaCT = motaCT;
    }

    public String getHinhCTSP() {
        return hinhCTSP;
    }

    public void setHinhCTSP(String hinhCTSP) {
        this.hinhCTSP = hinhCTSP;
    }

    public String getTieudeCTSP() {
        return tieudeCTSP;
    }

    public void setTieudeCTSP(String tieudeCTSP) {
        this.tieudeCTSP = tieudeCTSP;
    }

    public String getIDSP() {
        return IDSP;
    }

    public void setIDSP(String IDSP) {
        this.IDSP = IDSP;
    }

    public String getIdLoai() {
        return idLoai;
    }

    public void setIdLoai(String idLoai) {
        this.idLoai = idLoai;
    }

    public String getTenHinh() {
        return tenHinh;
    }

    public void setTenHinh(String tenHinh) {
        this.tenHinh = tenHinh;
    }

}
