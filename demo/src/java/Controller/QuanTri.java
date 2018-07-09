/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Bean.SanPhamBean;
import Model.SanPham;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author ASUS
 */
@Controller
@Transactional
@RequestMapping("admin")
public class QuanTri {

    @Autowired
    SessionFactory factory;

    @RequestMapping("index")
    public String index(ModelMap model, HttpServletRequest request) {
        System.out.println("URL: " + request.getRealPath(""));
        String[] s = request.getRealPath("").split("build");
        System.out.println("Path: " + s[0] + s[1]);
        String url = s[0] + s[1] + "images\\product\\ABC";
        File f = new File(url);
        if (!f.exists()) {
            if (f.mkdir()) {
                System.out.println("Success");
            } else {
                System.out.println("Fail");
            }
        }
        model.addAttribute("page", "/inc/admin/" + 1 + ".jsp");
        return "admin/admin";
    }

    @RequestMapping("content")
    public String content(@RequestParam("page") String page, ModelMap model) {
        model.addAttribute("page", "/inc/admin/" + page + ".jsp");
        return "admin/admin";
    }

    @RequestMapping("contentDetailProduct")
    public String contentDetailProduct(@RequestParam("page") String page, ModelMap model) {
        Session s = factory.getCurrentSession();
        try {
            String hql = "From SanPham";
            Query query = s.createQuery(hql);
            List<SanPham> ds = query.list();
            List<SanPhamBean> dsbean = new ArrayList<>();
            for (SanPham sp : ds) {
                String[] ch = sp.getHinhSP().split(";");
                SanPhamBean spbean = new SanPhamBean(sp.getTenSP(), sp.getGiaSP(), ch[0], sp.getLoai().getIDLoai(), sp.getIDSP());
                dsbean.add(spbean);
            }
            System.out.println("HinhSP: "+dsbean.get(0).getHinhSP());
            System.out.println("ListSPBean: " + dsbean.size());
            model.addAttribute("list", dsbean);
            model.addAttribute("page", "/inc/admin/" + page + ".jsp");
        } catch (Exception ex) {
            System.out.println(ex);
        }

        return "admin/admin";
    }
}
