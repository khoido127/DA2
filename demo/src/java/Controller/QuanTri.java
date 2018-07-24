/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Bean.CTHDBean;
import Bean.CTSPBean;
import Bean.CommentBean;
import Bean.HinhThucTTBean;
import Bean.LoaiSPBean;
import Bean.SanPhamBean;
import Bean.SizeBean;
import Bean.SlideBean;
import Bean.isAdmin;
import Model.CTSP;
import Model.Comment;
import Model.HoaDon;
import Model.Kho;
import Model.Loai;
import Model.NhanVien;
import Model.SanPham;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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

    @RequestMapping("login")
    public String Login() {
        return "admin/login";
    }

    @RequestMapping("checkLogin")
    public String checkLogin(HttpServletRequest request, HttpSession session) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Session s = factory.getCurrentSession();
        try {
            String hql = "From NhanVien nv where nv.username=:username and nv.password=:password";
            Query query = s.createQuery(hql);
            query.setParameter("username", username);
            query.setParameter("password", password);
            List<NhanVien> ds = query.list();
            if (ds.size() > 0) {
                session.setAttribute("username", username);
                return "redirect:index.htm?user=" + username;
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return "admin/login";
    }

    @RequestMapping("index")
    public String index(ModelMap model, HttpServletRequest request, HttpSession session) {
        System.out.println("URL: " + request.getRealPath(""));
        String[] s = request.getRealPath("").split("build");
        System.out.println("Path: " + s[0] + s[1]);
        String user = request.getParameter("user");
        System.out.println("User: " + user);
        if (user == null) {
            return "admin/login";
        }
//        String url = s[0] + s[1] + "images\\product\\ABC";
//        File f = new File(url);
//        if (!f.exists()) {
//            if (f.mkdir()) {
//                System.out.println("Success");
//            } else {
//                System.out.println("Fail");
//            }
//        }
//        model.addAttribute("page", "/inc/admin/" + 1 + ".jsp");
        session.setAttribute("user", user);
        return "redirect:contentDetailProduct.htm?page=1";
    }

    @RequestMapping("content")
    public String content(@RequestParam("page") String page, ModelMap model) {
        model.addAttribute("page", "/inc/admin/" + page + ".jsp");
        return "admin/admin";
    }

    //Xu ly chuyen trang show data Table
    @RequestMapping("contentDetailProduct")
    public String contentDetailProduct(@RequestParam("page") String page, ModelMap model, HttpSession session) {
        try {
            String user = session.getAttribute("user").toString();
            if (user == null) {
                return "admin/login";
            }
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
        } catch (Exception ex) {
            System.out.println(ex);
            return "admin/login";
        }
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
    public String getDataEdit(@RequestParam("id") String id, ModelMap model, HttpServletResponse response) {
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
            model.addAttribute("urlDescription", "admin/showDescription.htm?id=" + id);
            model.addAttribute("urlComment", "admin/showComment.htm?id=" + id);
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
            sp.setIDSP(id);
            CTSP ctsp = new CTSP("", "", tensp, sp);
            System.out.println("ID-Edit: " + id);
            if (checkSP(id)) {
                editSave(sp);
            } else {
                insertSave(sp);
                insertCTSP(ctsp);
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return "redirect:getDataEdit.htm?id=" + id;
    }
//    Tạo function insert sản phẩm ào table IDSP

    public void insertCTSP(CTSP ctsp) {
        Session s = factory.openSession();
        Transaction t = s.beginTransaction();
        try {
            s.saveOrUpdate(ctsp);
            t.commit();
        } catch (Exception ex) {
            t.rollback();
            System.out.println(ex);
        }
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
        System.out.println("ID: " + id);
        return "admin/pageDeleteSP";
    }

    @RequestMapping("deleteSP")
    public String deleteSP(@RequestParam("id") String id, HttpServletRequest request) {
        context = request.getServletContext();
        try {

            String[] ids = id.split(";");
            for (int i = 0; i < ids.length; i++) {
                String idloai = getLoaiSP(ids[i]);
                String pathbuild = context.getRealPath("/images/product/" + idloai + "/" + ids[i]);
                String[] ch = context.getRealPath("/images/product/" + idloai + "/" + ids[i]).split("build");
                String pathDest = ch[0] + ch[1];
                File fBuild = new File(pathbuild);
                File fDest = new File(pathDest);
                SanPham sp = new SanPham();
                sp.setIDSP(ids[i]);
                int stt = getSTTInCTSP(ids[i]);
                CTSP ctsp = new CTSP();
                ctsp.setSTT(stt);
                System.out.println("STT: " + stt);
                System.out.println("Length: " + ids.length);
                if (deleteDir(fBuild, fDest)) {
                    System.out.println("SuccessDelete");
                }
                deleteProductInCTSP(ctsp);
                deleteProduct(sp);

            }

        } catch (Exception ex) {
//            t.rollback();
            System.out.println(ex);
        }
        return "redirect:contentDetailProduct.htm?page=1";
    }

    //Get STT in CTSP
    public int getSTTInCTSP(String id) {
        Session s = factory.getCurrentSession();
        int stt = 0;
        try {
            String hql = "From CTSP ct where ct.sp.IDSP=:id";
            Query query = s.createQuery(hql);
            query.setParameter("id", id);
            List<CTSP> ds = query.list();
            stt = ds.get(0).getSTT();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return stt;
    }

    //Hàm xóa thư mục sản phẩm sau khi delete
    public boolean deleteDir(File fBuild, File fDest) {
        try {
            FileUtils.deleteDirectory(fBuild);
            FileUtils.deleteDirectory(fDest);
            return true;
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return false;
    }

    public void deleteProduct(SanPham sp) {
        Session s = factory.openSession();
        Transaction t = s.beginTransaction();
        try {
            s.delete(sp);
            t.commit();
        } catch (Exception ex) {
            t.rollback();
            System.out.println(ex);
        }
    }

    //Xử lý Delete SP trong CTSP
    public void deleteProductInCTSP(CTSP ctsp) {
        Session s = factory.openSession();
        Transaction t = s.beginTransaction();
        try {
            s.delete(ctsp);
            t.commit();
        } catch (Exception ex) {
            t.rollback();
            System.out.println(ex);
        }
    }

    //Xu ly phan Description Product
    //Tạo hàm lấy dữ liệu của 1 sản phẩm -> có thể được dùng lại
    public List<SanPham> getDataProduct(String id) {
        Session s = factory.getCurrentSession();
        List<SanPham> ds = new ArrayList<>();
        try {
            String hql = "From SanPham sp where sp.IDSP=:id";
            Query query = s.createQuery(hql);
            query.setParameter("id", id);
            ds = query.list();

        } catch (Exception ex) {
            System.out.println(ex);
        }
        return ds;
    }

    //Get thong tin loai SP theo IDSP
    public String getLoaiSP(String id) {
        Session s = factory.getCurrentSession();
        String idLoai = "";
        try {
            String hql = "From SanPham sp where sp.IDSP=:id";
            Query query = s.createQuery(hql);
            query.setParameter("id", id);
            List<SanPham> ds = query.list();
            idLoai = ds.get(0).getLoai().getIDLoai();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return idLoai;
    }
    //Xu ly phan Show Data CTSP

    @RequestMapping("showDescription")
    public String showDescription(ModelMap model, @RequestParam("id") String id, HttpServletRequest request) {
        String func = request.getParameter("function");
        try {
            List<SanPham> ds = getDataProduct(id);
            List<CTSPBean> list = new ArrayList<>();
            int index = 0;
            int size = 0;
            int dem = 0;
            for (SanPham sp : ds) {
                String idLoai = sp.getLoai().getIDLoai();
                String[] tieude = sp.getCtsp().get(0).getTieudeCTSP().split("\\^");
                List<String> td = new ArrayList<>();
                for (int i = 0; i < tieude.length; i++) {
                    td.add(tieude[i]);
                }
                String[] mota = sp.getCtsp().get(0).getMotaCT().split("\\^");
                List<String> mt = new ArrayList<>();
                for (int i = 0; i < mota.length; i++) {
                    mt.add(mota[i]);
                }
                String[] hinh = sp.getCtsp().get(0).getHinhCTSP().split(";");
                List<String> anh = new ArrayList<>();
                for (int i = 0; i < hinh.length; i++) {
                    anh.add(hinh[i]);
                }
                Integer[] n = {tieude.length, mota.length, hinh.length};
                Arrays.sort(n, Collections.reverseOrder());
                size = n[0];
                if (tieude.length > mota.length) {
                    dem = 1;
//                    size = tieude.length;
                } else if (tieude.length < mota.length) {
                    dem = 2;
//                    size = mota.length;
                } else {
                    dem = 3;
//                    size = hinh.length;
                }
                System.out.println("Size: " + size);
                System.out.println("Dem: " + dem);
                if (dem == 1) {

                    for (int i = mota.length; i < tieude.length; i++) {
                        mt.add("");
                    }
                    for (int i = hinh.length; i < tieude.length; i++) {
                        anh.add("");
                    }
                }
                if (dem == 2) {

                    for (int i = tieude.length; i < mota.length; i++) {
                        td.add("");
                    }
                    for (int i = hinh.length; i < mota.length; i++) {
                        anh.add("");
                    }
                }
                if (dem == 3) {

                    for (int i = mota.length; i < hinh.length; i++) {
                        mt.add("");
                    }
                    for (int i = tieude.length; i < hinh.length; i++) {
                        td.add("");
                    }
                }
                System.out.println("ListTD: " + td.size());
                System.out.println("ListMT: " + mt.size());
                System.out.println("ListHinh: " + anh.size());
                if (func != null) {
                    size = size + 1;
                }
                System.out.println("Size: " + size);
                for (int i = 0; i < size; i++) {
                    CTSPBean ctbean;
                    if (func != null && size - i == 1) {
                        ctbean = new CTSPBean(id, idLoai, "", "images/product/no-image.jpg", "", "");
                    } else {
                        if (hinh[i].length() == 0) {
                            ctbean = new CTSPBean(id, idLoai, mt.get(i), "images/product/no-image.jpg", td.get(i), anh.get(i));
                        } else {
                            ctbean = new CTSPBean(id, idLoai, mt.get(i), "images/product/" + idLoai + "/" + id + "/" + anh.get(i), td.get(i), anh.get(i));
                        }
                    }
//                    ctbean = new CTSPBean(id, idLoai, mt.get(i), anh.get(i), td.get(i));
                    list.add(ctbean);
                }

            }
            System.out.println("Success");
            CTSPBean ctbean = new CTSPBean();
            model.addAttribute("idsp", id);
            model.addAttribute("sumIndex", size);
            model.addAttribute("formEdit", ctbean);
            model.addAttribute("listCTSP", list);
            model.addAttribute("page", "/inc/admin/" + "2" + ".jsp");
        } catch (Exception ex) {
            System.out.println(ex);
        }

        return "admin/admin";
    }

    //Xử lý phần Save khi Edit Description
    @RequestMapping("saveToEditDescription")
    public String saveToEditDescription(HttpServletRequest request, ModelMap model, @RequestParam("fileUpload") CommonsMultipartFile[] fileUpload) {
        String index = request.getParameter("vitri");
        int sumIndex = Integer.parseInt(String.valueOf(request.getParameter("sumIndex")));
        String image = request.getParameter("image");
        String id = request.getParameter("IDSP");
        String tieude = request.getParameter("tieude");
        String mota = request.getParameter("mota");
        String idloai = request.getParameter("idloai");
        Session s = factory.openSession();
        Transaction t = s.beginTransaction();
        context = request.getServletContext();
        try {
            System.out.println("Index: " + index);
            System.out.println("IDSP: " + id);
            System.out.println("TieuDe: " + tieude);
            System.out.println("MoTa: " + mota);
            String[] ch = context.getRealPath("/images/product/" + idloai + "/" + id + "/").split("build");
            String urlBuild = context.getRealPath("/images/product/" + idloai + "/" + id + "/");
            String destPath = ch[0] + ch[1];
            String img = "";
            if (fileUpload != null && fileUpload.length > 0) {
                for (CommonsMultipartFile aFile : fileUpload) {

                    System.out.println("Saving file: " + aFile.getOriginalFilename());
                    String[] c = aFile.getOriginalFilename().split("\\.");

                    String nameImage = "CT" + index;
                    System.out.println("NameImage: " + nameImage);
                    if (!aFile.getOriginalFilename().equals("")) {
                        aFile.transferTo(new File(urlBuild + nameImage + ".jpg"));
                        aFile.transferTo(new File(destPath + nameImage + ".jpg"));
                    }

                }
                int n = checkImage(id);
                System.out.println("Length: " + n);
                int vitri = Integer.parseInt(index);

                for (int i = 0; i < sumIndex; i++) {
                    img = img + "CT" + (i + 1) + ".jpg" + ";";
//                    System.out.println("Link: " + img);
                }
            }
            System.out.println("URL: " + image);
            List<SanPham> ds = getCTSP(id);
            int stt = 0;
            for (SanPham sp : ds) {
                stt = sp.getCtsp().get(0).getSTT();
            }
            System.out.println("IMG: " + img);
            System.out.println("SumIndex: " + sumIndex);
            SanPham sp = new SanPham();
            sp.setIDSP(id);
            CTSP ct = new CTSP(stt, mota, image, tieude, sp);
            saveDescription(ct);
        } catch (Exception ex) {
            t.rollback();
            System.out.println(ex);
        }
//        System.out.println("Index: " + index);
        return "redirect:showDescription.htm?id=" + id;
    }

    //Kiểm tra số hinh hiện đang có trong database
    public int checkImage(String id) {
        Session s = factory.getCurrentSession();
        String hql = "From SanPham sp where sp.IDSP=:id";
        Query query = s.createQuery(hql);
        query.setParameter("id", id);
        List<SanPham> ds = query.list();
        int number = 0;
        for (SanPham sp : ds) {
            String[] image = sp.getCtsp().get(0).getHinhCTSP().split(";");
            number = image.length;
        }
        return number;
    }

    public List<SanPham> getCTSP(String id) {
        Session s = factory.getCurrentSession();
        String hql = "From SanPham sp where sp.IDSP=:id";
        Query query = s.createQuery(hql);
        query.setParameter("id", id);
        List<SanPham> ds = query.list();
        return ds;
    }

    //Save Description Product
    public void saveDescription(CTSP ct) {
        Session s = factory.openSession();
        Transaction t = s.beginTransaction();
        try {
            s.update(ct);
            t.commit();
        } catch (Exception ex) {
            t.rollback();
            ex.printStackTrace();
        }
    }

    //Chuyển trang delete Description
    @RequestMapping("pageDeleteDescription")
    public String pageDeleteDescription(HttpServletRequest request, ModelMap model) {
        String hinh = request.getParameter("hinh");
        String tieude = request.getParameter("tieude");
        String mota = request.getParameter("mota");
        String id = request.getParameter("id");

        model.addAttribute("hinh", hinh);
        model.addAttribute("tieude", tieude);
        model.addAttribute("mota", mota);
        model.addAttribute("id", id);
        System.out.println("MoTa: " + mota);
        return "admin/pageDeleteDesc";
    }

    //Xử lý phần Delete Description
    @RequestMapping("deleteDescription")
    public String deleteDescription(HttpServletRequest request) {
        System.out.println("PageDeleteDescription");
        String hinh = request.getParameter("hinh");
        String tieude = request.getParameter("tieude");
        String mota = request.getParameter("mota");
        String id = request.getParameter("id");
        Session s = factory.openSession();
        Transaction t = s.beginTransaction();
        try {
            List<SanPham> ds = getCTSP(id);
            int stt = 0;
            for (SanPham sp : ds) {
                stt = sp.getCtsp().get(0).getSTT();
            }
            SanPham sp = new SanPham();
            sp.setIDSP(id);
            CTSP ct = new CTSP(stt, mota, hinh, tieude, sp);
            s.update(ct);
            t.commit();
        } catch (Exception ex) {
            t.rollback();
            System.out.println(ex);
        }
        return "redirect:showDescription.htm?id=" + id;
    }

    //Xử lý page Comment
    //Show Comment của 1 product
    @RequestMapping("showComment")
    public String showComment(@RequestParam("id") String id, ModelMap model) {
        Session s = factory.getCurrentSession();
        SimpleDateFormat frm = new SimpleDateFormat("dd/MM/yyyy");
        try {
            System.out.println("ID: " + id);
            String hql = "From Comment cm where cm.sp.IDSP=:id";
            Query query = s.createQuery(hql);
            query.setParameter("id", id);
            List<Comment> ds = query.list();
            if (ds.size() == 0) {
                model.addAttribute("notShow", "Sản phẩm này chưa được comment!");
            }
            List<CommentBean> dsbean = new ArrayList<>();
            for (Comment cm : ds) {
                String ngaycm = frm.format(cm.getNgayCM());
                CommentBean cmbean = new CommentBean(cm.getSTT(), cm.getTenKH(), cm.getEmail(), cm.getMoTa(), cm.getSp().getIDSP(), ngaycm, cm.getURL(), cm.getReply(), "");
                dsbean.add(cmbean);
            }
            model.addAttribute("idsp", id);
            System.out.println("ListCM: " + ds.size());
            model.addAttribute("listcm", dsbean);
            model.addAttribute("page", "/inc/admin/" + "3" + ".jsp");
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return "admin/admin";
    }

    public List<Comment> getDataComment(String id, int stt) {
        Session s = factory.getCurrentSession();
        List<Comment> ds = new ArrayList<>();
        try {
            String hql = "From Comment cm where cm.sp.IDSP=:id and cm.STT=:stt";
            Query query = s.createQuery(hql);
            query.setParameter("id", id);
            query.setParameter("stt", stt);
            ds = query.list();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return ds;
    }

    //Xử lý Save data Comment
    @RequestMapping("getDataToSaveComment")
    public String getDataToSaveComment(ModelMap model, HttpServletRequest request) {
        String id = request.getParameter("idsp");
        String messageReply = request.getParameter("messageReply");
        int stt = Integer.parseInt(String.valueOf(request.getParameter("stt")));
        SimpleDateFormat frm = new SimpleDateFormat("yyyy-MM-dd");
        Session s = factory.openSession();
        Transaction t = s.beginTransaction();
        try {
            List<Comment> ds = getDataComment(id, stt);
            System.out.println("ListCM: " + ds.size());
            for (Comment cm : ds) {
                SanPham sp = new SanPham();
                sp.setIDSP(id);
                Comment comment = new Comment(stt, sp, cm.getTenKH(), cm.getMoTa(), cm.getEmail(), cm.getURL(), messageReply, cm.getNgayCM(), new Date());
                s.update(comment);
                t.commit();
            }

        } catch (Exception ex) {
            t.rollback();
            System.out.println(ex);
        }
        return "redirect:showComment.htm?id=" + id;
    }

    //Page Delete Comment
    @RequestMapping("pageDeleteComment")
    public String pageDeleteComment(@RequestParam("stt") int stt, @RequestParam("id") String id, ModelMap model) {
        model.addAttribute("stt", stt);
        model.addAttribute("id", id);
        return "admin/pageDeleteComment";
    }

    //Delete Comment
    @RequestMapping("deleteComment")
    public String deleteComment(@RequestParam("stt") int stt, @RequestParam("id") String id) {
        Session s = factory.openSession();
        Transaction t = s.beginTransaction();
        try {
            Comment cm = new Comment();
            cm.setSTT(stt);
            s.delete(cm);
            t.commit();
        } catch (Exception ex) {
            t.rollback();
            System.out.println(ex);
        }
        return "redirect:showComment.htm?id=" + id;
    }

    /*
    Edit Brand
    Show Data Brand
     */
    @RequestMapping("showBrand")
    public String showBrand(ModelMap model, HttpServletRequest request) {
        Session session = factory.getCurrentSession();
        try {
            String idLoai = request.getParameter("idLoai");
            String tenLoai = request.getParameter("tenLoai");
            String check = request.getParameter("check");
            String sql = "FROM Loai";
            Query query = session.createQuery(sql);
            List<Loai> listLoai = query.list();
            model.addAttribute("listLoai", listLoai);
            model.addAttribute("page", "/inc/admin/" + "5" + ".jsp");
            model.addAttribute("idLoai", idLoai);
            model.addAttribute("tenLoai", tenLoai);
            if (check != null) {
                model.addAttribute("readonly", "readonly");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "admin/admin";
    }

    // Edit Brand
    @RequestMapping("editBrand")
    public String editBrand(@RequestParam("idLoai") String idLoai, @RequestParam("tenLoai") String tenLoai, ModelMap model) {
        System.out.println("IDLoai: " + idLoai);
        return "redirect:showBrand.htm?idLoai=" + idLoai + "&tenLoai=" + tenLoai + "&check=true";

    }

    public boolean checkBrand(String idLoai) {
        Session session = factory.getCurrentSession();
        try {
            String sql = "FROM Loai loai WHERE loai.IDLoai=:idLoai";
            Query query = session.createQuery(sql);
            query.setParameter("idLoai", idLoai);
            List<Loai> listLoai = query.list();
            if (listLoai.size() > 0) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @RequestMapping("saveEditBrand")
    public String saveEditBrand(@RequestParam("idLoai") String idLoai, @RequestParam("tenLoai") String tenLoai, HttpServletRequest request, ModelMap model) {
        context = request.getServletContext();
        String[] s = context.getRealPath("/images/product/" + idLoai + "/").split("build");
        System.out.println(s[0] + s[1]);
        try {
            Loai loai = new Loai(idLoai, tenLoai);
            if (!checkBrand(idLoai)) {
                System.out.println("Insert");
                String url = s[0] + s[1];
                File f = new File(url);
                if (!f.exists()) {
                    if (f.mkdir()) {
                        System.out.println("Success");
                    } else {
                        System.out.println("Fail");
                    }
                }

                insertSaveBrand(loai);

            } else {
                editSaveBrand(loai);
                model.addAttribute("readonly", "");
            }
            model.addAttribute("page", "/inc/admin/" + 5 + ".jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:showBrand.htm?idLoai=" + idLoai;
    }

    public void editSaveBrand(Loai loai) {
        Session session = factory.openSession();
        Transaction transaction = session.beginTransaction();
        try {
            session.update(loai);
            transaction.commit();
        } catch (Exception ex) {
            transaction.rollback();
            System.out.println(ex);
        }
    }

    //Xu ly phan Save sau khi Insert
    public void insertSaveBrand(Loai loai) {
        Session session = factory.openSession();
        Transaction transaction = session.beginTransaction();
        try {
            session.save(loai);
            transaction.commit();
        } catch (Exception ex) {
            transaction.rollback();
            System.out.println(ex);
        }
    }

    // PageDeleteBrand
    @RequestMapping("pageDeleteBrand")
    public String pageDeleteBrand(@RequestParam("idLoai") String idLoai, ModelMap model) {
        System.out.println("IDLoai: " + idLoai);
        model.addAttribute("idLoai", idLoai);
        return "admin/pageDeleteBrand";
    }

    @RequestMapping("deleteBrand")
    public String deleteBrand(@RequestParam("idLoai") String idLoai, ModelMap model) {
        Session session = factory.openSession();
        Transaction transaction = session.beginTransaction();
        try {
            Loai loai = new Loai();
            loai.setIDLoai(idLoai);
            session.delete(loai);
            transaction.commit();
        } catch (Exception e) {
            transaction.rollback();
        }
        return "redirect:showBrand.htm";
    }

    // Xử lý HoaDon
    //Tạo 1 function show danh sach toan bo HoaDon
    public List<HoaDon> getHoaDon() {
        Session s = factory.getCurrentSession();
        List<HoaDon> ds = new ArrayList<>();
        try {
            String hql = "From HoaDon";
            Query query = s.createQuery(hql);
            ds = query.list();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return ds;
    }

    //Tạo 1 function get thong tin cua 1 HoaDon dua vao IDHD
    public List<HoaDon> getHoaDonByID(String id) {
        Session s = factory.getCurrentSession();
        List<HoaDon> ds = new ArrayList<>();
        try {
            String hql = "From HoaDon hd where hd.IDHD=:id";
            Query query = s.createQuery(hql);
            query.setParameter("id", id);
            ds = query.list();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return ds;
    }

    //Show danh sach HoaDon
    @RequestMapping("showHoaDon")
    public String showHoaDon(ModelMap model) {
        List<HoaDon> ds = getHoaDon();
        List<CTHDBean> dsBean = new ArrayList<>();
        String[] s = {"In Process", "On Way", "Payed"};
        List<HinhThucTTBean> dsTT = new ArrayList<>();
        for (int i = 0; i < 3; i++) {
            HinhThucTTBean ttBean = new HinhThucTTBean(s[i], "");
            dsTT.add(ttBean);
        }
        CTHDBean ctbean = new CTHDBean("", new Date(), "", "", "", "", 0);
        dsBean.add(ctbean);
        model.addAttribute("listEditDescribe", dsBean);
        model.addAttribute("listTT", dsTT);
        model.addAttribute("listHD", ds);
        model.addAttribute("page", "/inc/admin/" + "6" + ".jsp");
        model.addAttribute("control", "");
        return "admin/admin";
    }

    //Show Chi tiet HD
    @RequestMapping("showDetailHD")
    public String showDetailHD(ModelMap model, @RequestParam("id") String id) {
        List<CTHDBean> dsBean = new ArrayList<>();
        CTHDBean ctbean = new CTHDBean(id, "", "", "", "", "");
        dsBean.add(ctbean);
        showDetailHoaDon(id, model);
        model.addAttribute("page", "/inc/admin/" + "7" + ".jsp");
        model.addAttribute("listEditDetail", dsBean);
        return "admin/admin";
    }

    public void showDetailHoaDon(String id, ModelMap model) {
        List<HoaDon> ds = getHoaDonByID(id);
        List<CTHDBean> dsHDBean = new ArrayList<>();
        for (HoaDon hd : ds) {
            String[] tensp = hd.getTenSP().split("\\^");
            String[] size = hd.getSize().split("\\^");
            String[] sl = hd.getSL().split("\\^");
            String[] gia = hd.getGia().split("\\^");
            String[] idsp = hd.getIdSP().split("\\^");
            for (int i = 0; i < tensp.length; i++) {
                CTHDBean ctbean = new CTHDBean(id, tensp[i], sl[i], size[i], gia[i], idsp[i]);
                dsHDBean.add(ctbean);
            }
        }
        System.out.println("DetailHD: " + dsHDBean.size());
        model.addAttribute("control", "detail");
        model.addAttribute("listDetailHD", dsHDBean);
    }

    //Get data show ra field để Edit Detail HD
    @RequestMapping("getDataShowEditDetailHD")
    public String getDataEditDetailHD(@RequestParam("id") String id, @RequestParam("index") int index, ModelMap model) {
        List<CTHDBean> dsBean = new ArrayList<>();
        List<HoaDon> ds = getHoaDonByID(id);
        String IDSP = "", s = "", selected = "";
        for (HoaDon hd : ds) {
            String[] tensp = hd.getTenSP().split("\\^");
            String[] size = hd.getSize().split("\\^");
            String[] sl = hd.getSL().split("\\^");
            String[] gia = hd.getGia().split("\\^");
            String[] idsp = hd.getIdSP().split("\\^");
            for (int i = 0; i < tensp.length; i++) {
                if (i == index) {
                    IDSP = idsp[i];
                    s = size[i];
                    CTHDBean ctbean = new CTHDBean(id, tensp[i], sl[i], size[i], gia[i], idsp[i]);
                    dsBean.add(ctbean);

                }
            }
            String[] sz = getSizeOfSP(IDSP).split(";");
            List<SizeBean> dsSize = new ArrayList<>();
            for (int i = 0; i < sz.length; i++) {
                if (sz[i].equals(s)) {
                    selected = "selected";
                } else {
                    selected = "";
                }
                SizeBean sizeBean = new SizeBean(sz[i], selected);
                dsSize.add(sizeBean);
            }
            System.out.println("ListEditDetail: " + dsBean.size());
            showDetailHoaDon(id, model);
            model.addAttribute("listEditDetail", dsBean);
            model.addAttribute("index", index);
            model.addAttribute("page", "/inc/admin/" + "7" + ".jsp");
            model.addAttribute("listSize", dsSize);
        }
        return "admin/admin";
    }

    //Hàm Save HoaDon
    public void saveHoaDon(HoaDon hd) {
        Session s = factory.openSession();
        Transaction t = s.beginTransaction();
        try {
            s.update(hd);
            t.commit();
        } catch (Exception ex) {
            t.rollback();
            System.out.println(ex);
        }
    }

    //Get Size trong kho theo từng sản phẩm
    public String getSizeOfSP(String idsp) {
        Session s = factory.getCurrentSession();
        String size = "";
        try {
            String hql = "From Kho k where k.sp.IDSP=:id";
            Query query = s.createQuery(hql);
            query.setParameter("id", idsp);
            List<Kho> ds = query.list();
            size = ds.get(0).getSize();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return size;
    }

    //Get Data To Save Detail HD
    @RequestMapping("getDataToSaveDetailHD")
    public String getDataToSaveDetailHD(ModelMap model, HttpServletRequest request) {
        List<CTHDBean> dsBean = new ArrayList<>();
        String id = request.getParameter("idhd");
        int index = Integer.parseInt(String.valueOf(request.getParameter("index")));
        String IDSP = request.getParameter("IDSP");
        String Name = request.getParameter("TenSP");
        String Size = request.getParameter("Size");
        String SL = request.getParameter("SL");
        String Gia = request.getParameter("Gia");
        String s0 = "", s1 = "", s2 = "", s3 = "", s4 = "";
        List<HoaDon> ds = getHoaDonByID(id);
        for (HoaDon hd : ds) {
            String[] idsp = hd.getIdSP().split("\\^");
            String[] tensp = hd.getTenSP().split("\\^");
            String[] size = hd.getSize().split("\\^");
            String[] sl = hd.getSL().split("\\^");
            String[] gia = hd.getGia().split("\\^");

            for (int i = 0; i < tensp.length; i++) {
                if (i == index) {
                    idsp[i] = IDSP;
                    tensp[i] = Name;
                    size[i] = Size;
                    sl[i] = SL;
                    gia[i] = Gia;

                }
                s1 = s1 + tensp[i] + "^";
                s2 = s2 + size[i] + "^";
                s3 = s3 + sl[i] + "^";
                s4 = s4 + gia[i] + "^";
            }
            HoaDon hoadon = new HoaDon(id, hd.getNgay(), hd.getHinhThucTT(), hd.getLoaiHD(), s1, hd.getIdSP(), s3, s2, s4, hd.getTenKH(), hd.getSDT(), hd.getDiaChi(), hd.getEmail(), hd.getTrangThai(), hd.getTongTien());
            saveHoaDon(hoadon);
        }
        System.out.println("");

        return "redirect:getDataShowEditDetailHD.htm?id=" + id + "&index=" + index;
    }

    //Chuyển sang trang PageDeleteDetailHD
    @RequestMapping("pageDeleteDetailHD")
    public String pageDeleteDetailHD(@RequestParam("id") String id, @RequestParam("count") String count, ModelMap model) {
        model.addAttribute("id", id);
        model.addAttribute("count", count);
        return "admin/pageDeleteDetailHD";
    }
    //Tạo hàm Delete Detail HD

    //Xử lý Delete Detail HD
    @RequestMapping("deleteDetailHD")
    public String deleteDetailHD(HttpServletRequest request, ModelMap model) {
        String IDSP = request.getParameter("IDSP");
        String idhd = request.getParameter("id");
        String count = request.getParameter("count");
        String s0 = "", s1 = "", s2 = "", s3 = "", s4 = "";
        List<HoaDon> ds = getHoaDonByID(idhd);
        for (HoaDon hd : ds) {
            String[] idsp = hd.getIdSP().split("\\^");
            String[] tensp = hd.getTenSP().split("\\^");
            String[] size = hd.getSize().split("\\^");
            String[] sl = hd.getSL().split("\\^");
            String[] gia = hd.getGia().split("\\^");
            String[] ch = count.split(";");
            for (int i = 0; i < tensp.length; i++) {
                for (int j = 0; j < ch.length; j++) {
                    int vt = Integer.parseInt(ch[j]);
                    if (i == vt) {
                        s0 = s0 + idsp[i] + "^";
                        s1 = s1 + tensp[i] + "^";
                        s2 = s2 + size[i] + "^";
                        s3 = s3 + sl[i] + "^";
                        s4 = s4 + gia[i] + "^";
                    }
                }

            }
            String tongtien = "";
            String[] chuoi = s4.split("\\^");
            String[] chQuantity = s3.split("\\^");
            double total = 0;
            for (int i = 0; i < chuoi.length; i++) {
                double g = Double.parseDouble(chuoi[i]);
                int quantity = Integer.parseInt(chQuantity[i]);
                total = total + g;
            }
            System.out.println("TongTien: " + total);
//            total=Double.parseDouble(tongtien);
            HoaDon hoadon = new HoaDon(idhd, hd.getNgay(), hd.getHinhThucTT(), hd.getLoaiHD(), s1, s0, s3, s2, s4, hd.getTenKH(), hd.getSDT(), hd.getDiaChi(), hd.getEmail(), hd.getTrangThai(), total);
            saveHoaDon(hoadon);
        }
        return "redirect:showDetailHD.htm?id=" + idhd;
    }

    //Show data để Edit Describe HD
    @RequestMapping("getDataShowEditDescribe")
    public String getDataShowEditDescribe(@RequestParam("id") String id, ModelMap model) {
        List<HoaDon> ds = getHoaDonByID(id);
        List<CTHDBean> dsBean = new ArrayList<>();
        List<HoaDon> dsHD = getHoaDon();

        String trangthai = "";
        for (HoaDon hd : ds) {
            trangthai = hd.getTrangThai();
            CTHDBean ctbean = new CTHDBean(id, hd.getNgay(), hd.getHinhThucTT(), hd.getTenKH(), hd.getSDT(), hd.getDiaChi(), hd.getTongTien());
            dsBean.add(ctbean);
        }
        String[] s = {"In Process", "On Way", "Payed"};
        List<HinhThucTTBean> dsTT = new ArrayList<>();
        String checked = "";
        System.out.println("HinhThucTT: " + trangthai);
        for (int i = 0; i < 3; i++) {
            if (trangthai.equalsIgnoreCase(s[i])) {
                checked = "checked";
            } else {
                checked = "";
            }
            HinhThucTTBean ttBean = new HinhThucTTBean(s[i], checked);
            dsTT.add(ttBean);
        }
        model.addAttribute("readonly", "readonly");
        model.addAttribute("listEditDescribe", dsBean);
        model.addAttribute("listTT", dsTT);
        model.addAttribute("listHD", dsHD);
        model.addAttribute("page", "/inc/admin/" + "6" + ".jsp");
        model.addAttribute("control", "");
        return "admin/admin";
    }

    //Get dữ liệu Size, số lượng trong kho theo IDSP
    public List<Kho> getDataKho(String idsp) {
        Session s = factory.getCurrentSession();
        List<Kho> ds = new ArrayList<>();
        try {
            String hql = "From Kho k where k.sp.IDSP=:idsp";
            Query query = s.createQuery(hql);
            query.setParameter("idsp", idsp);
            ds = query.list();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return ds;
    }

    //Tạo function xử lý việc update lại số lượng trong kho theo size
    public void updateSoLuongKho(String idsp, String sl, String sz) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        int soluong = Integer.parseInt(sl);
        int n = 0;
        String s = "";
        try {
            List<Kho> ds = getDataKho(idsp);
            for (Kho k : ds) {
                String[] size = k.getSize().split(";");
                String[] quantity = k.getSL().split(";");
                for (int i = 0; i < size.length; i++) {
                    n = Integer.parseInt(quantity[i]);
                    if (size[i].equals(sz)) {
                        n = n - soluong;
                    }
                    s = s + String.valueOf(n) + ";";
                }
                SanPham sp = new SanPham();
                sp.setIDSP(idsp);
                Kho kho = new Kho(k.getSTT(), s, k.getSize(), sp);
                session.update(kho);
                t.commit();
            }
        } catch (Exception ex) {
            t.rollback();
            System.out.println(ex);
        }

    }

    //Xử lý phần Save Describe
    @RequestMapping("saveDescribeHD")
    public String saveDescribeHD(CTHDBean ctbean, HinhThucTTBean ttBean) {
        String idhd = ctbean.getIDHD();
        String tenkh = ctbean.getTenKH();
        String sdt = ctbean.getSDT();
        String diachi = ctbean.getDiaChi();
        String trangthai = ttBean.getHinhThucTT();
        System.out.println("TrangThai: " + trangthai);
        System.out.println("IDHD: " + idhd);
        List<HoaDon> ds = getHoaDonByID(idhd);
        for (HoaDon hd : ds) {
            String[] idsp = hd.getIdSP().split("\\^");
            String[] soluong = hd.getSL().split("\\^");
            String[] size = hd.getSize().split("\\^");
            if (trangthai.equalsIgnoreCase("Payed")) {
                for (int i = 0; i < soluong.length; i++) {
                    updateSoLuongKho(idsp[i], soluong[i], size[i]);
                }
            }
            System.out.println("Hello");
            HoaDon hoadon = new HoaDon(idhd, hd.getNgay(), hd.getHinhThucTT(), hd.getLoaiHD(), hd.getTenSP(), hd.getIdSP(), hd.getSL(), hd.getSize(), hd.getGia(), tenkh, sdt, diachi, hd.getEmail(), trangthai, hd.getTongTien());
            saveHoaDon(hoadon);
        }
        return "redirect:showHoaDon.htm";
    }

    //Delete Describe HD
    @RequestMapping("pageDeleteDescribeHD")
    public String pageDeleteDescribeHD(@RequestParam("id") String id, ModelMap model) {
        model.addAttribute("id", id);
        return "admin/pageDeleteDescribeHD";
    }

    @RequestMapping("deleteDescribeHD")
    public String deleteDescribeHD(ModelMap model, @RequestParam("id") String id) {
        String[] idhd = id.split(";");
        for (int i = 0; i < idhd.length; i++) {
            deleteDescribe(idhd[i]);
        }
        return "redirect:showHoaDon.htm";
    }

    public void deleteDescribe(String idhd) {
        Session s = factory.openSession();
        Transaction t = s.beginTransaction();
        try {
            HoaDon hd = new HoaDon();
            hd.setIDHD(idhd);
            s.delete(hd);
            t.commit();
        } catch (Exception ex) {
            t.rollback();
            System.out.println(ex);
        }
    }
    // user page //

    @RequestMapping("showuser") // do du lieu ra table //
    public String showuser(ModelMap model) {
        getalluser(model);
        List<isAdmin> roles = new ArrayList<>();
        boolean[] ch = {true, false};
        String s = "Staff";
        String checked = "";
        for (int i = 0; i < ch.length; i++) {
            if (ch[i] == true) {
                s = "Admin";
                checked = "checked";
            } else {
                s = "Staff";
            }
            isAdmin role = new isAdmin(ch[i], checked, s);
            roles.add(role);
        }
        List<NhanVien> list = new ArrayList<>();
        NhanVien nv = new NhanVien(" ", "", Boolean.TRUE, " ", "images/product/no-image.jpg");
        list.add(nv);
        model.addAttribute("src", "images/product/no-image.jpg");
        model.addAttribute("listRole", roles);
        model.addAttribute("list1nv", list);
        model.addAttribute("page", "/inc/admin/" + "4" + ".jsp");
        return "admin/admin";
    }

    public void getalluser(ModelMap model) {
        Session s = factory.getCurrentSession();
        try {
            String sql = "From NhanVien";
            Query q = s.createQuery(sql);
            List<NhanVien> list = q.list();
            model.addAttribute("listnv", list);
            model.addAttribute("page", "/inc/admin/" + "4" + ".jsp");
        } catch (Exception e) {
        }
    }

    public List<NhanVien> get1user(String username) {
        Session s = factory.getCurrentSession();
        List<NhanVien> nv = new ArrayList<>();
        try {
            String sql = "From NhanVien nv where nv.username=:username";
            Query q = s.createQuery(sql);
            q.setParameter("username", username);
            nv = q.list();
        } catch (Exception e) {
        }
        return nv;
    }

    @RequestMapping("editnv")
    public String edit1nv(@RequestParam("username") String username, ModelMap model) {
        List<NhanVien> nv = get1user(username);
        boolean isadmin = nv.get(0).getIsAdmin();
        getalluser(model);
        List<isAdmin> roles = new ArrayList<>();
        boolean[] ch = {true, false};
        String s = "";

        String checked = "";
        for (int i = 0; i < ch.length; i++) {
            if (ch[i] == true) {
                s = "Admin";
            } else {
                s = "Staff";
            }
            if (ch[i] == isadmin) {
                checked = "checked";
            } else {
                checked = "";
            }
            isAdmin role = new isAdmin(ch[i], checked, s);
            roles.add(role);
        }
        model.addAttribute("src", "images/" + nv.get(0).getImg());
        model.addAttribute("readonly", "readonly");
        model.addAttribute("listRole", roles);
        model.addAttribute("list1nv", nv);
        model.addAttribute("page", "/inc/admin/" + "4" + ".jsp");
        return "admin/admin";
    }

    @RequestMapping("saveToEditUser")
    public String saveToEditUser(@RequestParam("fileupload") CommonsMultipartFile[] fileUpload, HttpServletRequest request, ModelMap model) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Boolean isAdmin = Boolean.parseBoolean(String.valueOf(request.getParameter("isAdmin")));
        String info = request.getParameter("info");
        String nameImage = "";
        context = request.getServletContext();
        System.out.println("User: " + username);
        String[] ch = context.getRealPath("/images/").split("build");
        String destPath = ch[0] + ch[1];
        String urlBuild = context.getRealPath("/images/");
        System.out.println("URLPath: " + destPath);
        try {
            if (fileUpload != null && fileUpload.length > 0) {
                for (CommonsMultipartFile aFile : fileUpload) {

                    System.out.println("Saving file: " + aFile.getOriginalFilename());
//                    String[] c = aFile.getOriginalFilename().split(".");
                    //Lay dinh dang file
                    nameImage = aFile.getOriginalFilename();
                    System.out.println("NameImage: " + nameImage);
                    String typeImage = "jpg";
//                    System.out.println("TypeImage: " + c.length);
                    if (!aFile.getOriginalFilename().equals("")) {
                        aFile.transferTo(new File(urlBuild + nameImage));
                        aFile.transferTo(new File(destPath + nameImage));
                    }
                }
            }
            if (nameImage == "") {
                nameImage = request.getParameter("srcimg");
            }
            System.out.println(nameImage);
            NhanVien nv = new NhanVien(username, password, isAdmin, info, nameImage);
            saveupdateuser(nv);
        } catch (Exception ex) {
        }
        return "redirect:showuser.htm";
    }

    public void saveupdateuser(NhanVien nv) {
        Session s = factory.openSession();
        Transaction t = s.beginTransaction();
        try {
            s.saveOrUpdate(nv);
            t.commit();
        } catch (Exception e) {
            t.rollback();
        }
    }

    @RequestMapping("deleteuser")
    public String deleteuser(@RequestParam("username") String username) {
        String[] ch = username.split(";");
        for (int i = 0; i < ch.length; i++) {
            deluser(ch[i]);
        }
        return "redirect:showuser.htm";
    }

    public void deluser(String username) {
        Session s = factory.openSession();
        Transaction t = s.beginTransaction();
        try {
            NhanVien nv = new NhanVien();
            nv.setUsername(username);
            s.delete(nv);
            t.commit();
        } catch (Exception e) {
            t.rollback();
        }
    }

    @RequestMapping("pageconfirmuser")
    public String pageconfirmuser(ModelMap model, @RequestParam("username") String username) {
        System.out.println(username);
        model.addAttribute("username", username);
        return "admin/pageDeleteUser";
    }
}
