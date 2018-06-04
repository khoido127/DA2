/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

/**
 *
 * @author Administrator
 */
public class SearchBean {
    private String IDSP;
    private String tenSP;

    public SearchBean() {
    }

    public SearchBean(String IDSP, String tenSP) {
        this.IDSP = IDSP;
        this.tenSP = tenSP;
    }

    public String getIDSP() {
        return IDSP;
    }

    public void setIDSP(String IDSP) {
        this.IDSP = IDSP;
    }

    public String getTenSP() {
        return tenSP;
    }

    public void setTenSP(String tenSP) {
        this.tenSP = tenSP;
    }
    
}
