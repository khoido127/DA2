/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author Visible
 */
@Entity
public class Comment implements Serializable {

    @Id
    @GeneratedValue
    private Integer STT;
    private String TenKH;
    private String moTa;
    private String Email;
    private String URL;
    private String reply;
    @Temporal(TemporalType.TIMESTAMP)
    private Date NgayCM;
    @Temporal(TemporalType.TIMESTAMP)
    private Date ngayReply;
    @ManyToOne
    @JoinColumn(name = "IDSP")
    SanPham sp;

    public Comment() {
    }

    public Comment(Integer STT, String TenKH, String MoTa, String Email, SanPham sp) {
        this.STT = STT;
        this.TenKH = TenKH;
        this.moTa = MoTa;
        this.Email = Email;
        this.sp = sp;
    }

    public Comment(String TenKH, String moTa, String Email, Date NgayCM, SanPham sp, String URL) {
        this.TenKH = TenKH;
        this.moTa = moTa;
        this.Email = Email;
        this.NgayCM = NgayCM;
        this.sp = sp;
        this.URL = URL;
    }

    public Comment(Integer STT, SanPham sp, String TenKH, String moTa, String Email, String URL, String reply, Date NgayCM, Date ngayReply) {
        this.STT = STT;
        this.sp = sp;
        this.TenKH = TenKH;
        this.moTa = moTa;
        this.Email = Email;
        this.URL = URL;
        this.reply = reply;
        this.NgayCM = NgayCM;
        this.ngayReply = ngayReply;
    }

    public Integer getSTT() {
        return STT;
    }

    public void setSTT(Integer STT) {
        this.STT = STT;
    }

    public String getTenKH() {
        return TenKH;
    }

    public void setTenKH(String TenKH) {
        this.TenKH = TenKH;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public SanPham getSp() {
        return sp;
    }

    public void setSp(SanPham sp) {
        this.sp = sp;
    }

    public String getURL() {
        return URL;
    }

    public void setURL(String URL) {
        this.URL = URL;
    }

    public Date getNgayCM() {
        return NgayCM;
    }

    public void setNgayCM(Date NgayCM) {
        this.NgayCM = NgayCM;
    }

    public String getReply() {
        return reply;
    }

    public void setReply(String reply) {
        this.reply = reply;
    }

    public Date getNgayReply() {
        return ngayReply;
    }

    public void setNgayReply(Date ngayReply) {
        this.ngayReply = ngayReply;
    }

}
