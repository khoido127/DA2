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
public class isAdmin {
    private boolean isAdmin;
    private String role;
    private String checked;

    public isAdmin() {
    }

    public isAdmin(boolean isAdmin, String checked,String role) {
        this.isAdmin = isAdmin;
        this.checked = checked;
        this.role=role;
    }

    public boolean isIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(boolean isAdmin) {
        this.isAdmin = isAdmin;
    }

    public String getChecked() {
        return checked;
    }

    public void setChecked(String checked) {
        this.checked = checked;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
    
    
}
