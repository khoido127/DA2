/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class CTHDBean {
    private String IDHD;
    private Date ngay;
    private String hinhthuctt;
    private String TenSP;
    private String SL;
    private String Size;
    private String Gia;
    private String TenKH;
    private String SDT;
    private String diaChi;
    private String Email;
    private String IDSP;
    public static List<CTHDBean> hd=new ArrayList<>();
    public CTHDBean() {
    }

    public CTHDBean(String IDHD, Date ngay, String hinhthuctt, String TenSP, String SL, String Size, String Gia, String TenKH, String SDT, String diaChi, String Email, String IDSP) {
        this.IDHD = IDHD;
        this.ngay = ngay;
        this.hinhthuctt = hinhthuctt;
        this.TenSP = TenSP;
        this.SL = SL;
        this.Size = Size;
        this.Gia = Gia;
        this.TenKH = TenKH;
        this.SDT = SDT;
        this.diaChi = diaChi;
        this.Email = Email;
        this.IDSP = IDSP;
    }
 
    public CTHDBean(String TenSP, String SL, String Size, String Gia, String TenKH, String SDT, String diaChi, String Email, String IDSP) {
        this.TenSP = TenSP;
        this.SL = SL;
        this.Size = Size;
        this.Gia = Gia;
        this.TenKH = TenKH;
        this.SDT = SDT;
        this.diaChi = diaChi;
        this.Email = Email;
        this.IDSP = IDSP;
    }

    public String getIDHD() {
        return IDHD;
    }

    public void setIDHD(String IDHD) {
        this.IDHD = IDHD;
    }

    public Date getNgay() {
        return ngay;
    }

    public void setNgay(Date ngay) {
        this.ngay = ngay;
    }

    public String getHinhthuctt() {
        return hinhthuctt;
    }

    public void setHinhthuctt(String hinhthuctt) {
        this.hinhthuctt = hinhthuctt;
    }

    public String getTenSP() {
        return TenSP;
    }

    public void setTenSP(String TenSP) {
        this.TenSP = TenSP;
    }

    public String getSL() {
        return SL;
    }

    public void setSL(String SL) {
        this.SL = SL;
    }

    public String getGia() {
        return Gia;
    }

    public void setGia(String Gia) {
        this.Gia = Gia;
    }
    
    public String getSize() {
        return Size;
    }

    public void setSize(String Size) {
        this.Size = Size;
    }


    public String getTenKH() {
        return TenKH;
    }

    public void setTenKH(String TenKH) {
        this.TenKH = TenKH;
    }

    public String getSDT() {
        return SDT;
    }

    public void setSDT(String SDT) {
        this.SDT = SDT;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getIDSP() {
        return IDSP;
    }

    public void setIDSP(String IDSP) {
        this.IDSP = IDSP;
    }

    public static List<CTHDBean> getHd() {
        return hd;
    }

    public static void setHd(List<CTHDBean> hd) {
        CTHDBean.hd = hd;
    }
    
}
