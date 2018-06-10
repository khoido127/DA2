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
    private String TenLoai;
    private String checked;

    public LoaiSPBean() {
    }

    public LoaiSPBean(String IDLoai, String TenLoai, String checked) {
        this.IDLoai = IDLoai;
        this.TenLoai = TenLoai;
        this.checked = checked;
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
        return TenLoai;
    }

    public void setTenLoai(String TenLoai) {
        this.TenLoai = TenLoai;
    }

}
