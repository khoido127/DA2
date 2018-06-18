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

    private String motaCT;
    private String hinhCTSP;
    private String tieudeCTSP;
    public CTSPBean() {
    }

    public CTSPBean(String motaCT, String hinhCTSP, String tieudeCTSP) {
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

    
}
