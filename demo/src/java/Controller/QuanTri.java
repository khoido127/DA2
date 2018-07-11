/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Bean.LoaiSPBean;
import Bean.SanPhamBean;
import Bean.SlideBean;
import Model.Loai;
import Model.SanPham;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import org.apache.commons.io.FileUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

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
    ServletContext context;

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
//        model.addAttribute("page", "/inc/admin/" + 1 + ".jsp");
        return "redirect:contentDetailProduct.htm?page=1";
    }

    @RequestMapping("content")
    public String content(@RequestParam("page") String page, ModelMap model) {
        model.addAttribute("page", "/inc/admin/" + page + ".jsp");
        return "admin/admin";
    }

    //Xu ly chuyen trang show data Table
    @RequestMapping("contentDetailProduct")
    public String contentDetailProduct(@RequestParam("page") String page, ModelMap model) {
        List<SanPhamBean> dsPageEdit = new ArrayList<>();
        List<Loai> dsLoai = getLoaiSP();
        List<LoaiSPBean> dsLoaiSPBean = new ArrayList<>();
        List<SlideBean> slide = new ArrayList<>();
        for (int i = 0; i < 3; i++) {
            slide.add(new SlideBean("images/product/no-image.jpg"));
        }
        String selected = "";
        for (Loai l : dsLoai) {
            LoaiSPBean loaispbean = new LoaiSPBean(l.getIDLoai(), l.getTenLoai(), selected);
            dsLoaiSPBean.add(loaispbean);
        }
//        List<SanPhamBean> dsbean = showDataTable();
        SanPhamBean spbean = new SanPhamBean("", 0, "0", "", "", "", "", "");
        dsPageEdit.add(spbean);
        showDataTable(model);
        model.addAttribute("listSlide", slide);
        model.addAttribute("listLoai", dsLoaiSPBean);
        model.addAttribute("listEdit", dsPageEdit);
        model.addAttribute("page", "/inc/admin/" + page + ".jsp");
        model.addAttribute("src", "images/product/no-image.jpg");
        return "admin/admin";
    }

    //Function Show data ra Table
    public void showDataTable(ModelMap model) {
        Session s = factory.getCurrentSession();
        String hql = "From SanPham";
        Query query = s.createQuery(hql);
        List<SanPham> ds = query.list();
        List<SanPhamBean> dsbean = new ArrayList<>();
        for (SanPham sp : ds) {
            String[] ch = sp.getHinhSP().split(";");
            SanPhamBean spbean = new SanPhamBean(sp.getTenSP(), sp.getGiaSP(), ch[0], sp.getLoai().getIDLoai(), sp.getIDSP(), sp.getLoai().getTenLoai());
            dsbean.add(spbean);
        }
        System.out.println("HinhSP: " + dsbean.get(0).getHinhSP());
        System.out.println("ListSPBean: " + dsbean.size());
        model.addAttribute("list", dsbean);
    }

    // Lay du lieu LoaiSP
    public List<Loai> getLoaiSP() {
        Session s = factory.getCurrentSession();
        String hql = "From Loai";
        Query query = s.createQuery(hql);
        List<Loai> ds = query.list();
        return ds;
    }

    //End
    //Xu ly phan Edit
    //Xu ly phan show du lieu de Edit
    @RequestMapping("getDataEdit")
    public String getDataEdit(@RequestParam("id") String id, ModelMap model) {
        Session s = factory.getCurrentSession();
        try {
            String hql = "From SanPham sp where sp.IDSP=:id";
            Query query = s.createQuery(hql);
            query.setParameter("id", id);
            List<SanPham> ds = query.list();
            List<SanPhamBean> dsbean = new ArrayList<>();
            //Khoi tao mang Slide hinh sp
            List<SlideBean> slide = new ArrayList<>();
            //Lay du lieu LoaiSP
            List<Loai> dsLoai = getLoaiSP();
            List<LoaiSPBean> dsLoaiSPBean = new ArrayList<>();
            String selected = "";
            String loai = ds.get(0).getLoai().getIDLoai();
            System.out.println("LoaiSP: " + loai);
            for (Loai l : dsLoai) {
                if (loai.equals(l.getIDLoai())) {
                    selected = "selected";
                } else {
                    selected = "";
                }
                LoaiSPBean loaispbean = new LoaiSPBean(l.getIDLoai(), l.getTenLoai(), selected);
                dsLoaiSPBean.add(loaispbean);
            }
            //Lay data sp dua vao List
            for (SanPham sp : ds) {
                String[] ch = sp.getHinhSP().split(";");
                String giaspkm = String.valueOf(sp.getGiaSPKM());
                model.addAttribute("hinhDaiDien", ch[0]);
                for (int i = 0; i < ch.length; i++) {
                    SlideBean slbean = new SlideBean("images/product/" + sp.getLoai().getIDLoai() + "/" + sp.getIDSP() + "/" + ch[i]);
                    slide.add(slbean);
                }
                model.addAttribute("src", "images/product/" + sp.getLoai().getIDLoai() + "/" + sp.getIDSP() + "/" + ch[0]);
                SanPhamBean spbean = new SanPhamBean(sp.getTenSP(), sp.getGiaSP(), giaspkm, "", sp.getLoai().getIDLoai(), sp.getIDSP(), sp.getLoai().getTenLoai(), sp.getMoTa());
                dsbean.add(spbean);
            }
            //End 

            showDataTable(model);
            model.addAttribute("listLoai", dsLoaiSPBean);
            model.addAttribute("status", "readonly");
            model.addAttribute("statusBrand", "disabled");
            model.addAttribute("page", "/inc/admin/" + "1" + ".jsp");
            model.addAttribute("listEdit", dsbean);
            model.addAttribute("listSlide", slide);
            System.out.println("DSPageEdit: " + dsbean.size());
            System.out.println("DSSlide: " + slide.size());
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return "admin/admin";
    }

    //Save Edit
    @RequestMapping("saveToEdit")
    public String saveToEdit(@RequestParam("idImage") String nameImage, @RequestParam("fileUpload") CommonsMultipartFile[] fileUpload, HttpServletRequest request, ModelMap model) {
        String id = request.getParameter("IDSP");
        System.out.println("Size: " + id.length());

        String idloai = request.getParameter("IDLoai");
        System.out.println("IDLoai: " + idloai);
        String tensp = request.getParameter("TenSP");
        String moTa = request.getParameter("moTa");
        String hinhsp = request.getParameter("nameImage");
        double giaspkm = Double.parseDouble(request.getParameter("GiaSPKM"));
        double giasp = Double.parseDouble(request.getParameter("GiaSP"));
        System.out.println("NameImage: " + hinhsp);
        context = request.getServletContext();
        String[] ch = context.getRealPath("/images/product/" + idloai + "/" + id + "/").split("build");
        String destPath = ch[0] + ch[1];
        String urlBuild = "";
        System.out.println("Path: " + destPath);
        System.out.println(checkSP(id));
        try {
            if (!checkSP(id)) {

//                String[] s = context.getRealPath("/images/product/" + idloai + "/" + idNew + "/").split("build");
                urlBuild = context.getRealPath("/images/product/" + idloai + "/" + id + "/");
//                destPath = s[0] + s[1];
                System.out.println("IDSP-New: " + id);
                File f = new File(destPath);
                File fBuild = new File(urlBuild);
                if (!f.exists() && !fBuild.exists()) {
                    if (f.mkdir() && fBuild.mkdir()) {
                        System.out.println("Success");
                    } else {
                        System.out.println("Fail");
                    }
                }
            }
            if (fileUpload != null && fileUpload.length > 0) {
                for (CommonsMultipartFile aFile : fileUpload) {

                    System.out.println("Saving file: " + aFile.getOriginalFilename());
//                    String[] c = aFile.getOriginalFilename().split(".");
                    //Lay dinh dang file
                    String typeImage = "jpg";
//                    System.out.println("TypeImage: " + c.length);
                    if (!aFile.getOriginalFilename().equals("")) {

                        if (!checkSP(id)) {
                            hinhsp = "";
                            int indexImage = Integer.parseInt(nameImage);
                            for (int i = 1; i <= 3; i++) {
                                if (i == indexImage) {
                                    hinhsp = hinhsp + i + "." + typeImage + ";";
                                    aFile.transferTo(new File(destPath + nameImage + "." + typeImage));
                                    aFile.transferTo(new File(urlBuild + nameImage + "." + typeImage));
                                } else {
                                    hinhsp = hinhsp + i + ".jpg" + ";";
                                    String[] src = context.getRealPath("/images/product/no-image.jpg").split("build");
                                    String source = src[0] + src[1];
                                    File pathSource = new File(source);
                                    File renameFile = new File(destPath + i + ".jpg");
                                    File renameFileBuild = new File(urlBuild + i + ".jpg");
                                    File renameFileDest = new File(destPath + "no-image.jpg");
                                    File renameFileDestBuild = new File(urlBuild + "no-image.jpg");
                                    File pathDest = new File(destPath);
                                    File pathDestBuild = new File(urlBuild);
                                    FileUtils.copyFileToDirectory(pathSource, pathDest);
                                    FileUtils.copyFileToDirectory(pathSource, pathDestBuild);
                                    boolean result = renameFileDest.renameTo(renameFile);
                                    boolean resultBuild = renameFileDestBuild.renameTo(renameFileBuild);
                                    System.out.println("Result: " + result);
                                }
                            }
                            System.out.println("HinhSP: " + hinhsp);
                        } else {
                            aFile.transferTo(new File(urlBuild + nameImage + ".jpg"));
                            aFile.transferTo(new File(destPath + nameImage + ".jpg"));
                        }
                    }
                }
            }
            Loai loai = new Loai();
            loai.setIDLoai(idloai);
            SanPham sp = new SanPham(id, tensp, giaspkm, giasp, moTa, hinhsp, loai);
            System.out.println("ID-Edit: " + id);
            if (checkSP(id)) {
                editSave(sp);
            } else {
                insertSave(sp);
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return "redirect:getDataEdit.htm?id=" + id;
    }
    //Xu ly phan Save sau khi Edit

    public void editSave(SanPham sp) {
        Session s = factory.openSession();
        Transaction t = s.beginTransaction();
        try {
            s.update(sp);
            t.commit();
        } catch (Exception ex) {
            t.rollback();
            System.out.println(ex);
        }
    }

    //Xu ly phan Save sau khi Insert
    public void insertSave(SanPham sp) {
        Session s = factory.openSession();
        Transaction t = s.beginTransaction();
        try {
            s.save(sp);
            t.commit();
        } catch (Exception ex) {
            t.rollback();
            System.out.println(ex);
        }
    }

    //End xu ly Edit
    //Kiểm tra IDSP có tồn tại chưa
    public boolean checkSP(String id) {
        Session s = factory.getCurrentSession();
        String hql = "From SanPham sp where sp.IDSP=:id";
        Query query = s.createQuery(hql);
        query.setParameter("id", id);
        List<SanPham> ds = query.list();
        if (ds.size() > 0) {
            return true;
        }
        return false;
    }

    //Delete Product
    @RequestMapping("pageDeleteSP")
    public String pageDeleteSP(@RequestParam("id") String id, ModelMap model) {
        model.addAttribute("id", id);
        return "admin/pageDeleteSP";
    }

    @RequestMapping("deleteSP")
    public String deleteSP(@RequestParam("id") String id) {
        Session s = factory.openSession();
        Transaction t = s.beginTransaction();
        try {
            SanPham sp = new SanPham();
            sp.setIDSP(id);
            s.delete(sp);
            t.commit();
        } catch (Exception ex) {
            t.rollback();
            System.out.println(ex);
        }
        return "redirect:contentDetailProduct.htm?page=1";
    }
}
