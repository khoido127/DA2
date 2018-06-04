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
import javax.persistence.OneToMany;

/**
 *
 * @author Visible
 */
@Entity
public class Loai implements Serializable {

    @Id
    private String IDLoai;
    private String tenLoai;
    @OneToMany(mappedBy = "loai", fetch = FetchType.EAGER)
    List<SanPham> sp;

    public Loai() {
    }

    public Loai(String IDLoai, String TenLoai, List<SanPham> sp) {
        this.IDLoai = IDLoai;
        this.tenLoai = TenLoai;
        this.sp = sp;
    }

    public String getIDLoai() {
        return IDLoai;
    }

    public void setIDLoai(String IDLoai) {
        this.IDLoai = IDLoai;
    }

    public String getTenLoai() {
        return tenLoai;
    }

    public void setTenLoai(String tenLoai) {
        this.tenLoai = tenLoai;
    }

    public List<SanPham> getSp() {
        return sp;
    }

    public void setSp(List<SanPham> sp) {
        this.sp = sp;
    }

}
