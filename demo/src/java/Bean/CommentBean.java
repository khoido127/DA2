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
    private String Name;
    private String Email;
    private String Message;
    private String IDSP;
    private String NgayCM;
    private String URL;
    public CommentBean() {
    }

    public CommentBean(String Name, String Email, String Message) {
        this.Name = Name;
        this.Email = Email;
        this.Message = Message;
    }

    public CommentBean(String Name, String Email, String Message, String NgayCM, String URL) {
        this.Name = Name;
        this.Email = Email;
        this.Message = Message;
        this.NgayCM = NgayCM;
        this.URL = URL;
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
    
}
