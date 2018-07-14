/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Bean.CTSPBean;
import Bean.CommentBean;
import Bean.LoaiSPBean;
import Bean.SanPhamBean;
import Bean.SlideBean;
import Model.CTSP;
import Model.Comment;
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
    public String deleteSP(@RequestParam("id") String id, HttpServletRequest request) {
        Session s = factory.openSession();
        Transaction t = s.beginTransaction();
        context = request.getServletContext();
        try {
            String idloai = getLoaiSP(id);
            String pathbuild = context.getRealPath("/images/product/" + idloai + "/" + id);
            String[] ch = context.getRealPath("/images/product/" + idloai + "/" + id).split("build");
            String pathDest = ch[0] + ch[1];
            File fBuild = new File(pathbuild);
            File fDest = new File(pathDest);
            SanPham sp = new SanPham();
            sp.setIDSP(id);
            s.delete(sp);
            if (deleteDir(fBuild, fDest)) {
                System.out.println("SuccessDelete");
            }
            t.commit();
        } catch (Exception ex) {
            t.rollback();
            System.out.println(ex);
        }
        return "redirect:contentDetailProduct.htm?page=1";
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
                        ctbean = new CTSPBean(id, idLoai, mt.get(i), "images/product/" + idLoai + "/" + id + "/" + anh.get(i), td.get(i), anh.get(i));
                    }
//                    ctbean = new CTSPBean(id, idLoai, mt.get(i), anh.get(i), td.get(i));
                    list.add(ctbean);
                }

            }
            System.out.println("Success");
            CTSPBean ctbean = new CTSPBean();
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
    public String pageDeleteDescription(@RequestParam("vitri") String vitri, ModelMap model) {

        model.addAttribute("vitri", vitri);
        System.out.println("Vitri: " + vitri);
        return "admin/pageDeleteDesc";
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
}
