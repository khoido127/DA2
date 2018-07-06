/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

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
    public String index(ModelMap model) {
        model.addAttribute("page", "/inc/admin/" + 1 + ".jsp");
        return "admin/admin";
    }

    @RequestMapping("content")
    public String content(@RequestParam("page") String page, ModelMap model) {
        model.addAttribute("page", "/inc/admin/" + page + ".jsp");
        return "admin/admin";
    }
}
