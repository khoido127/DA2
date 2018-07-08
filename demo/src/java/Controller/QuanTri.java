/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.File;
import javax.servlet.http.HttpServletRequest;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author ASUS
 */
@Controller
@RequestMapping("admin")
public class QuanTri {

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
}
