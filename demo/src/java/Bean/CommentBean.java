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
public class CommentBean {

    private int stt;
    private String Name;
    private String Email;
    private String Message;
    private String IDSP;
    private String NgayCM;
    private String URL;
    private String reply;
    private String ngayReply;

    public CommentBean() {
    }

    public CommentBean(String Name, String Email, String Message) {
        this.Name = Name;
        this.Email = Email;
        this.Message = Message;
    }

    public CommentBean(String Name, String Email, String Message, String NgayCM, String URL, String reply, String ngayReply) {
        this.Name = Name;
        this.Email = Email;
        this.Message = Message;
        this.NgayCM = NgayCM;
        this.URL = URL;
        this.reply = reply;
        this.ngayReply = ngayReply;
    }

    public CommentBean(int stt, String Name, String Email, String Message, String IDSP, String NgayCM, String URL, String reply, String ngayReply) {
        this.stt = stt;
        this.Name = Name;
        this.Email = Email;
        this.Message = Message;
        this.IDSP = IDSP;
        this.NgayCM = NgayCM;
        this.URL = URL;
        this.reply = reply;
        this.ngayReply = ngayReply;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getMessage() {
        return Message;
    }

    public void setMessage(String Message) {
        this.Message = Message;
    }

    public String getIDSP() {
        return IDSP;
    }

    public void setIDSP(String IDSP) {
        this.IDSP = IDSP;
    }

    public String getNgayCM() {
        return NgayCM;
    }

    public void setNgayCM(String NgayCM) {
        this.NgayCM = NgayCM;
    }

    public String getURL() {
        return URL;
    }

    public void setURL(String URL) {
        this.URL = URL;
    }

    public String getReply() {
        return reply;
    }

    public void setReply(String reply) {
        this.reply = reply;
    }

    public String getNgayReply() {
        return ngayReply;
    }

    public void setNgayReply(String ngayReply) {
        this.ngayReply = ngayReply;
    }

    public int getStt() {
        return stt;
    }

    public void setStt(int stt) {
        this.stt = stt;
    }

}
