/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

/**
 *
 * @author Mask
 */
public class HinhThucTTBean {

    private String hinhThucTT;
    private String checked;

    public HinhThucTTBean() {
    }

    public HinhThucTTBean(String hinhThucTT, String checked) {
        this.hinhThucTT = hinhThucTT;
        this.checked = checked;
    }

    public String getHinhThucTT() {
        return hinhThucTT;
    }

    public void setHinhThucTT(String hinhThucTT) {
        this.hinhThucTT = hinhThucTT;
    }

    public String getChecked() {
        return checked;
    }

    public void setChecked(String checked) {
        this.checked = checked;
    }

}
