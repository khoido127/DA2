/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

/**
 *
 * @author Visible
 */
public class PageNumberBean {
    private int pageNumber;
    private String pageClick;
    public PageNumberBean() {
    }

    public PageNumberBean(int pageNumber, String pageClick) {
        this.pageNumber = pageNumber;
        this.pageClick = pageClick;
    }

    public PageNumberBean(String pageClick) {
        this.pageClick = pageClick;
    }
    
    public PageNumberBean(int pageNumber) {
        this.pageNumber = pageNumber;
    }

    public int getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(int pageNumber) {
        this.pageNumber = pageNumber;
    }

    public String getPageClick() {
        return pageClick;
    }

    public void setPageClick(String pageClick) {
        this.pageClick = pageClick;
    }
    
    
}
