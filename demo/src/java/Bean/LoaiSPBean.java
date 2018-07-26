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
public class LoaiSPBean {

    private String IDLoai;
    private String tenLoai;
    private String checked;
    private String selected;

    public LoaiSPBean() {
    }

    public LoaiSPBean(String IDLoai, String TenLoai, String checked, String selected) {
        this.IDLoai = IDLoai;
        this.tenLoai = TenLoai;
        this.checked = checked;
        this.selected = selected;
    }

    public String getIDLoai() {
        return IDLoai;
    }

    public void setIDLoai(String IDLoai) {
        this.IDLoai = IDLoai;
    }

    public String getChecked() {
        return checked;
    }

    public void setChecked(String checked) {
        this.checked = checked;
    }

    public String getTenLoai() {
        return tenLoai;
    }

    public void setTenLoai(String tenLoai) {
        this.tenLoai = tenLoai;
    }

    public String getSelected() {
        return selected;
    }

    public void setSelected(String selected) {
        this.selected = selected;
    }

}
