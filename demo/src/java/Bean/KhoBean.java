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
public class KhoBean {

    private String IDSP;
    private String size;
    private String soluong;
    private String trangthai;
    public KhoBean() {
    }

    public KhoBean(String IDSP, String size, String soluong, String trangthai) {
        this.IDSP = IDSP;
        this.size = size;
        this.soluong = soluong;
        this.trangthai = trangthai;
    }

    public KhoBean(String size, String soluong, String trangthai) {
        this.size = size;
        this.soluong = soluong;
        this.trangthai=trangthai;
    }
    
    
    public String getIDSP() {
        return IDSP;
    }

    public void setIDSP(String IDSP) {
        this.IDSP = IDSP;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getSoluong() {
        return soluong;
    }

    public void setSoluong(String soluong) {
        this.soluong = soluong;
    }

    public String getTrangthai() {
        return trangthai;
    }

    public void setTrangthai(String trangthai) {
        this.trangthai = trangthai;
    }
    
}
