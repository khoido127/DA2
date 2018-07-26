/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Bean.CTHDBean;
import Bean.CTSPBean;
import Bean.CommentBean;
import Bean.GioHang;
import Bean.KhoBean;
import Bean.LoaiSPBean;
import Bean.PageNumberBean;
import Bean.SanPhamBean;
import Bean.SearchBean;
import Bean.SlideBean;
import Model.HoaDon;
import Model.Comment;
import Model.Kho;

import Model.Loai;
import Model.SanPham;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Visible
 */
@Controller
@Transactional
@RequestMapping("Home")
public class XuLyTrangChu {

    @Autowired
    SessionFactory factory;

    //Xu ly phan chuyen trang
    @RequestMapping("redirectPage")
    public String redirectPage(@RequestParam("page") String page, HttpServletRequest request) {
        String type = request.getParameter("type");
        switch (page) {
            case "index":
                return "index";
            case "about":
                return "about";
            case "shop":
                return "redirect:pageShop.htm?type=" + type;
            case "contact":
                return "contact";
            case "checkout":
                return "checkout";
            case "payment":
                return "payment";
            case "login":
                return "login";
        }
        return "index";
    }

    //Xu ly phan show san pham ra page Shop theo tung nha san xuat
    @RequestMapping("pageShop")
    public String pageShop(SearchBean sbean, HttpServletRequest request, ModelMap model) {

        try {
            String tensp = sbean.getTenSP();
            System.out.println("TenSP: "+tensp);
            String code = request.getParameter("code");
            System.out.println("Code: " + code);
            String sort = "", type = "", idsp = "";
            int id = 1;
            if (code != null) {

                int t = 0;
                String[] s = getCode(code);
                while (s.length > 0) {

                    System.out.println("T: " + t);
                    if (s.length - t == 0) {
                        break;
                    }
                    switch (t) {
                        case 0:
                            id = Integer.parseInt(s[t]);
                            break;
                        case 1:
                            type = s[t];
                            break;
                        case 2:
                            sort = s[t];
                            break;
                        case 3:
                            idsp = s[t];
                            break;
                    }
                    t++;
                }
            }

            int sotrang = getPageNumberOfLoaiSP(type);
            System.out.println("TypeLoaiSP: "+type);
            System.out.println("TenSP: " + tensp);
            int maxNumberInPage = 6;
            int firstResult = phanTrang(maxNumberInPage, id);
            System.out.println("FirstResult: " + firstResult);
            List<SanPham> list = showListSP(request, type, firstResult, maxNumberInPage, sort, tensp);

            //Tach hinh anh ra
            List<SanPhamBean> listspbean = new ArrayList<>();
            List<PageNumberBean> dsPage = new ArrayList<>();
//            PageNumberBean pageClick=new PageNumberBean("click-change-page");
            for (int i = 1; i <= sotrang; i++) {
                PageNumberBean page = new PageNumberBean(i);
                dsPage.add(page);
            }
            for (SanPham sp : list) {
                String[] url = sp.getHinhSP().split(";");
                String giakm = "";
                String moneySave = "";
                double giasp = sp.getGiaSP();
                double moneySale = 0;
                double percentSale = 0;
                if (sp.getGiaSPKM() > 0) {
                    moneySale = sp.getGiaSP() - sp.getGiaSPKM();
                    giakm = "$" + String.valueOf(sp.getGiaSP());
                    giasp = sp.getGiaSPKM();
                    percentSale = Math.round((1 - (sp.getGiaSPKM() / sp.getGiaSP())) * 100);
                    System.out.println("PercentSale: " + percentSale);
                    moneySave = "You Save " + percentSale + "% " + " ($" + moneySale + ")";
                }
                SanPhamBean spbean = new SanPhamBean(sp.getIDSP(), sp.getTenSP(), giasp, url[0], url[1], sp.getLoai().getIDLoai(), sp.getMoTa(), moneySave, giakm);
                listspbean.add(spbean);
            }
            List<SanPhamBean> listtopsp = showRandomProduct();
            List<LoaiSPBean> listLoai = showListLoai(type);
            System.out.println("Type: " + type);
            System.out.println("ID: " + id);
            System.out.println("ListPage: " + dsPage.size());
            System.out.println("HinhSP: " + listspbean.get(0).getHinhPhu());
            model.addAttribute("listsp", listspbean);
            model.addAttribute("listPage", dsPage);
            model.addAttribute("listLoai", listLoai);
            model.addAttribute("listtopsp", listtopsp);
            request.setAttribute("idPage", id);
            request.setAttribute("type", type);
        } catch (Exception ex) {
            System.out.println(ex);
        }

        return "shop";
    }

    //Xu ly phan show thong tin chi tiet tung san pham
    @RequestMapping("pageSingle")
    public String pageSingle(HttpServletRequest request, ModelMap model) {
        String code = request.getParameter("code");
        String[] scode = getCode(code);
        String idsp = "";
        int t = 0;
        while (scode.length > 0) {

            System.out.println("T: " + t);
            if (scode.length - t == 0) {
                break;
            }
            switch (t) {
                case 0:
                    idsp = scode[t];
                    break;
            }
            t++;
        }
        System.out.println("IDSP: " + idsp);
        Session s = factory.getCurrentSession();
        String hql = "From SanPham sp where sp.IDSP=:id";
        Query query = s.createQuery(hql);
        query.setParameter("id", idsp);
        List<SanPham> list = query.list();
        List<CTSPBean> ctspbean = new ArrayList<>();

        //Xu ly noi dung CTSP
        for (int i = 0; i < list.size(); i++) {
            int st = 0;
            String[] hinhsp = list.get(0).getCtsp().get(0).getHinhCTSP().split(";");
            String[] motact = new String[10];
            String[] tieudeCTSP = new String[10];
            String mota = list.get(0).getCtsp().get(0).getMotaCT();
            String tieude = list.get(0).getCtsp().get(0).getTieudeCTSP();
            int length = 0;
            if (tieude == null) {
                tieudeCTSP[0] = "";
            } else {
                tieudeCTSP = list.get(0).getCtsp().get(0).getTieudeCTSP().split("\\^");
            }
            motact = list.get(0).getCtsp().get(0).getMotaCT().split("\\^");
            int result = motact.length - hinhsp.length;
            if (tieudeCTSP.length > hinhsp.length) {
                length = hinhsp.length;
            } else {
                length = tieudeCTSP.length;
            }
            if (length > motact.length) {
                length = motact.length;
            }
            System.out.println("MOTACT: " + motact[0]);
            System.out.println("Length: " + length);
            System.out.println("HinhSP: " + hinhsp[0]);
            CTSPBean sp = null;
            for (int j = 0; j < length; j++) {
                System.out.println("HINHSP: " + hinhsp[j]);
                sp = new CTSPBean(motact[j], hinhsp[j], tieudeCTSP[j]);
                ctspbean.add(sp);
            }
        }
        System.out.println("DSCTSP: " + ctspbean.size());
        //End

        //Xu ly Size
        List<KhoBean> listkho = new ArrayList<>();
        String[] size = list.get(0).getKho().get(0).getSize().split(";");
        String[] soluong = list.get(0).getKho().get(0).getSL().split(";");
        int sumIndex = size.length;
        for (int i = 0; i < size.length; i++) {
            String trangthai = "Size này còn " + soluong[i] + " sản phẩm";
            KhoBean kho = new KhoBean(idsp,size[i], soluong[i], trangthai);
            listkho.add(kho);
        }
        model.addAttribute("sumIndex", sumIndex);
        //End

        List<SlideBean> listurl = new ArrayList<>();
        List<SanPhamBean> listspbean = new ArrayList<>();
        List<CommentBean> listcm = showComment(idsp);
        GioHang gh = new GioHang();
        List<GioHang> dsgh = gh.getGh();
        if (dsgh.isEmpty()) {
            model.addAttribute("soluong", 0);
        } else {
            for (int i = 0; i < dsgh.size(); i++) {
                if (dsgh.get(i).getIDSP().equals(idsp)) {
                    model.addAttribute("soluong", dsgh.get(i).getSoluong());
                }
            }
        }
        for (SanPham sp : list) {
            String[] url = sp.getHinhSP().split(";");
            String giakm = "";
            String moneySave = "";
            double giasp = sp.getGiaSP();
            double moneySale = 0;
            double percentSale = 0;
            if (sp.getGiaSPKM() > 0) {
                moneySale = sp.getGiaSP() - sp.getGiaSPKM();
                giakm = "$" + String.valueOf(sp.getGiaSP());
                giasp = sp.getGiaSPKM();
                percentSale = Math.round((1 - (sp.getGiaSPKM() / sp.getGiaSP())) * 100);
                System.out.println("PercentSale: " + percentSale);
                moneySave = "You Save " + percentSale + "% " + " ($" + moneySale + ")";
            }
            SanPhamBean spbean = new SanPhamBean(sp.getIDSP(), sp.getTenSP(), giasp, url[0], url[1], sp.getLoai().getIDLoai(), sp.getMoTa(), moneySave, giakm);
            listspbean.add(spbean);
            for (int i = 0; i < url.length; i++) {
                SlideBean slide = new SlideBean(url[i]);
                listurl.add(slide);
            }
        }
        System.out.println("ListCM: " + listcm.size());
        List<SanPhamBean> listtopsp = showRandomProduct();
        model.addAttribute("listcm", listcm);
        model.addAttribute("listsp", listspbean);
        model.addAttribute("listurl", listurl);
        model.addAttribute("listtopsp", listtopsp);
        model.addAttribute("listctsp", ctspbean);
        model.addAttribute("listkho", listkho);
        System.out.println("URL: " + listurl.size());
        return "single";
    }

    //Xu ly phan show nhanh thong tin chi tiet tung san pham
    @RequestMapping("quickviewSingle")
    public String quickviewSingle(@RequestParam("id") String id, ModelMap model) {
        Session s = factory.getCurrentSession();
        String hql = "From SanPham sp where sp.IDSP=:id";
        Query query = s.createQuery(hql);
        query.setParameter("id", id);
        List<SanPham> list = query.list();
        List<SlideBean> listurl = new ArrayList<>();
        List<SanPhamBean> listspbean = new ArrayList<>();
        for (SanPham sp : list) {
            String[] url = sp.getHinhSP().split(";");
            String giakm = "";
            String moneySave = "";
            double giasp = sp.getGiaSP();
            double moneySale = 0;
            double percentSale = 0;
            if (sp.getGiaSPKM() > 0) {
                moneySale = sp.getGiaSP() - sp.getGiaSPKM();
                giakm = "$" + String.valueOf(sp.getGiaSP());
                giasp = sp.getGiaSPKM();
                percentSale = Math.round((1 - (sp.getGiaSPKM() / sp.getGiaSP())) * 100);
                System.out.println("PercentSale: " + percentSale);
                moneySave = "You Save " + percentSale + "% " + " ($" + moneySale + ")";
            }
            System.out.println("Gia: " + giasp);
            System.out.println("GiaKM: " + giakm);

            SanPhamBean spbean = new SanPhamBean(sp.getIDSP(), sp.getTenSP(), giasp, url[0], url[1], sp.getLoai().getIDLoai(), sp.getMoTa(), moneySave, giakm);
            listspbean.add(spbean);
            for (int i = 0; i < url.length; i++) {
                SlideBean slide = new SlideBean(url[i]);
                listurl.add(slide);
            }
        }
        model.addAttribute("listsp", listspbean);
        model.addAttribute("listurl", listurl);
        System.out.println("URL: " + listurl.size());
        return "modal-single";
    }

    //Show ra random san pham bat ky
    public List<SanPhamBean> showRandomProduct() {
        Session s = factory.getCurrentSession();
        String sql = "From SanPham";
        Query query1 = s.createQuery(sql);
        List<SanPham> ds = query1.list();
        Random rd = new Random();
        int n = rd.nextInt(ds.size() - 4) + 1;
        query1.setFirstResult(n);
        query1.setMaxResults(4);
        List<SanPham> list = query1.list();
//        List<SlideBean> listurl = new ArrayList<>();
        List<SanPhamBean> listspbean = new ArrayList<>();

        for (SanPham sp : list) {
            String[] url = sp.getHinhSP().split(";");
            String giakm = "";
            String moneySave = "";
            double giasp = sp.getGiaSP();
            double moneySale = 0;
            double percentSale = 0;
            if (sp.getGiaSPKM() > 0) {
                moneySale = sp.getGiaSP() - sp.getGiaSPKM();
                giakm = "$" + String.valueOf(sp.getGiaSP());
                giasp = sp.getGiaSPKM();
                percentSale = Math.round((1 - (sp.getGiaSPKM() / sp.getGiaSP())) * 100);
                System.out.println("PercentSale: " + percentSale);
                moneySave = "You Save " + percentSale + "% " + " ($" + moneySale + ")";
            }
            SanPhamBean spbean = new SanPhamBean(sp.getIDSP(), sp.getTenSP(), giasp, url[0], url[1], sp.getLoai().getIDLoai(), sp.getMoTa(), moneySave, giakm);
            listspbean.add(spbean);

        }

        return listspbean;
    }

    //Xu ly so trang
    @RequestMapping("pageNumber")
    public String pageNumber(@RequestParam("id") int id, HttpServletRequest request) {
        String type = request.getParameter("type");
        String sort = request.getParameter("sort");
        System.out.println("ID: " + id);
//        String type=request.getParameter("type");
        int sotrang;
        if (type.equals("all")) {
            sotrang = getPageNumber();
            return "redirect:showFull.htm?sotrang=" + sotrang + "&id=" + id + "&type=" + type;
        } else {
            return "redirect:pageShop.htm?id=" + id + "&type=" + type + "&sort=" + sort;
        }
    }

    //Lay ra List Loai San Pham
    public List<LoaiSPBean> showListLoai(String type) {
        List<Loai> list = new ArrayList<>();
        List<LoaiSPBean> listspbean = new ArrayList<>();
        try {
            Session s = factory.getCurrentSession();
            String hql = "From Loai";
            Query query = s.createQuery(hql);
            list = query.list();
            String checked = "";
            for (Loai l : list) {
                if (l.getIDLoai().equals(type)) {
                    checked = "checked";
                } else {
                    checked = "";
                }
                System.out.println("Check: " + checked);
                LoaiSPBean spbean = new LoaiSPBean(l.getIDLoai(), l.getTenLoai(), checked,"");
                listspbean.add(spbean);
            }
            System.out.println("ListSPBean: " + listspbean.size());
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return listspbean;
    }

    //Show cac san pham sau khi tim kiem
    @RequestMapping("pageShowSearch")
    public String pageShowSearch(SearchBean sbean, HttpServletRequest request, ModelMap model) {
        try {
            String tensp = sbean.getTenSP();
            List<SanPham> list = searchSP(tensp, request);
            System.out.println(list.size());
            //Tach hinh anh ra
            List<SanPhamBean> listspbean = new ArrayList<>();
            List<PageNumberBean> dsPage = new ArrayList<>();
            for (SanPham sp : list) {
                String[] url = sp.getHinhSP().split(";");
                String giakm = "";
                String moneySave = "";
                double giasp = sp.getGiaSP();
                double moneySale = 0;
                double percentSale = 0;
                if (sp.getGiaSPKM() > 0) {
                    moneySale = sp.getGiaSP() - sp.getGiaSPKM();
                    giakm = "$" + String.valueOf(sp.getGiaSP());
                    giasp = sp.getGiaSPKM();
                    percentSale = Math.round(1 - ((sp.getGiaSPKM() / sp.getGiaSP())) * 100);
                    System.out.println("PercentSale: " + percentSale);
                    moneySave = "You Save " + percentSale + "% " + " ($" + moneySale + ")";
                }
                SanPhamBean spbean = new SanPhamBean(sp.getIDSP(), sp.getTenSP(), giasp, url[0], url[1], sp.getLoai().getIDLoai(), sp.getMoTa(), moneySave, giakm);
                listspbean.add(spbean);
                System.out.println(list.size());
            }
            List<SanPhamBean> listtopsp = showRandomProduct();
            List<LoaiSPBean> listLoai = showListLoai("");
            System.out.println(listspbean.size());
            model.addAttribute("listsp", listspbean);
            model.addAttribute("listPage", dsPage);
            model.addAttribute("listLoai", listLoai);
            model.addAttribute("listtopsp", listtopsp);
            request.setAttribute("idPage", 1);
            request.setAttribute("type", "all");
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return "shop";
    }

    @RequestMapping("searchSP")
    public List<SanPham> searchSP(String tensp, HttpServletRequest request) {
        List<SanPham> listsp = new ArrayList<>();
        try {
//            SearchBean sbean=new SearchBean();
            Session s = factory.getCurrentSession();
            String hql = "From SanPham";
            Query query = s.createQuery(hql);
            List<SanPham> list = query.list();
            int dem = 0;
            for (SanPham sp : list) {
                String namepr = sp.getTenSP();
                if (namepr.toLowerCase().contains(tensp.toLowerCase())) {
                    dem++;
                    SanPham pr = new SanPham(sp.getIDSP(), sp.getTenSP(), sp.getGiaSPKM(), sp.getGiaSP(), sp.getMoTa(), sp.getHinhSP(), sp.getLoai());
                    listsp.add(pr);
                }
            }
            System.out.println("TenSPSearch: " + tensp);
            System.out.println("So phan tu: " + dem);
        } catch (Exception ex) {
//            System.out.println("TenSPSearch: " + list.size());
            System.out.println(ex);
        }
        return listsp;
    }

    //Lay ra List San Pham dua vao LoaiSP
    public List<SanPham> showListSP(HttpServletRequest request, String type, int firstResult, int maxNumberInPage, String sort, String tensp) {
        List<SanPham> list = new ArrayList<>();
        List<SanPham> dssp = new ArrayList<>();
//        System.out.println("TenSP: "+tensp);
        try {
            Session s = factory.getCurrentSession();
            String hql = "";
            if (tensp != null) {
                list = searchSP(tensp, request);
            } else {
                if (type.equals("all")) {
                    hql = hql + "From SanPham ";
                } else {
                    hql = hql + "From SanPham sp where sp.loai.IDLoai=:idloai";
                }
                Query query = s.createQuery(hql);
                if (!type.equals("all")) {
                    query.setParameter("idloai", type);
                }
                query.setFirstResult(firstResult);
                query.setMaxResults(maxNumberInPage);
                list = query.list();
//                System.out.println("DS: " + list.size());
//                System.out.println("Sort: " + sort);
                if (!sort.equals("")) {
                    if (sort.equals("asc")) {
//                        hql = hql + " order by GiaSP asc";
                        for (int i = 0; i < list.size(); i++) {
//                            System.out.println("I: " + i);
                            int t = i;
                            double a;
                            if (list.get(i).getGiaSPKM() != 0) {
                                a = list.get(i).getGiaSPKM();
                            } else {
                                a = list.get(i).getGiaSP();
                            }

//                            System.out.println("Size: " + list.size());
                            for (int j = 0; j < list.size(); j++) {
                                double b;
                                if (list.get(j).getGiaSPKM() != 0) {
                                    b = list.get(j).getGiaSPKM();
                                } else {
                                    b = list.get(j).getGiaSP();
                                }
                                if (a > b) {
                                    a = b;
                                    t = j;
                                }
                                if (list.size() - j == 1) {
//                                    System.out.println("T: " + t);
//                                    System.out.println("a[" + j + "]= " + j);
//                                    System.out.println("TenSP: " + list.get(t).getTenSP());
                                    SanPham sp = new SanPham(list.get(t).getIDSP(), list.get(t).getTenSP(), list.get(t).getGiaSPKM(), list.get(t).getGiaSP(), list.get(t).getMoTa(), list.get(t).getHinhSP(), list.get(t).getLoai());
                                    dssp.add(sp);
                                    list.remove(t);
                                    i = 0;

                                }
                                if (list.size() == 1) {
                                    System.out.println("ListSizeLast: " + list.size());
                                    System.out.println("TenSPLast: " + list.get(list.size() - 1).getTenSP());
                                    int index = list.size() - 1;
                                    SanPham sp = new SanPham(list.get(index).getIDSP(), list.get(index).getTenSP(), list.get(index).getGiaSPKM(), list.get(index).getGiaSP(), list.get(index).getMoTa(), list.get(index).getHinhSP(), list.get(index).getLoai());
                                    dssp.add(sp);
                                }
                            }
                        }
                    } else if (sort.equals("desc")) {
                        for (int i = 0; i < list.size(); i++) {
//                            System.out.println("I: " + i);
                            int t = i;
                            double a;
                            if (list.get(i).getGiaSPKM() != 0) {
                                a = list.get(i).getGiaSPKM();
                            } else {
                                a = list.get(i).getGiaSP();
                            }
                            System.out.println("Size: " + list.size());
                            for (int j = 0; j < list.size(); j++) {
                                double b;
                                if (list.get(j).getGiaSPKM() != 0) {
                                    b = list.get(j).getGiaSPKM();
                                } else {
                                    b = list.get(j).getGiaSP();
                                }
                                if (b > a) {
                                    a = b;
                                    t = j;
                                }
                                if (list.size() - j == 1) {

                                    System.out.println("T: " + t);
                                    System.out.println("a[" + j + "]= " + j);
                                    System.out.println("TenSP: " + list.get(t).getTenSP());
                                    SanPham sp = new SanPham(list.get(t).getIDSP(), list.get(t).getTenSP(), list.get(t).getGiaSPKM(), list.get(t).getGiaSP(), list.get(t).getMoTa(), list.get(t).getHinhSP(), list.get(t).getLoai());
                                    dssp.add(sp);
                                    list.remove(t);
                                    System.out.println("ListSize: " + list.size());
                                    i = 0;

                                }
                                if (list.size() == 1) {
                                    System.out.println("ListSizeLast: " + list.size());
                                    System.out.println("TenSPLast: " + list.get(list.size() - 1).getTenSP());
                                    int index = list.size() - 1;
                                    SanPham sp = new SanPham(list.get(index).getIDSP(), list.get(index).getTenSP(), list.get(index).getGiaSPKM(), list.get(index).getGiaSP(), list.get(index).getMoTa(), list.get(index).getHinhSP(), list.get(index).getLoai());
                                    dssp.add(sp);
                                }
                            }
                        }
                    }
                    return dssp;
                }
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
        System.out.println("DSSP: " + list.size());
        return list;
    }
    //Lay ra so trang cua tat ca San Pham

    public int getPageNumber() {
        Session s = factory.getCurrentSession();
        String hql = "From SanPham";
        Query query = s.createQuery(hql);
        List<SanPham> list = query.list();
        //Xu ly so trang
        int maxNumberInPage = 6;
        int sotrang = list.size() % maxNumberInPage;
        if (sotrang != 0) {
            sotrang = (list.size() / maxNumberInPage) + 1;
        } else {
            sotrang = list.size() / maxNumberInPage;
        }
        return sotrang;
    }

    //Lay ra so trang theo LoaiSP
    public int getPageNumberOfLoaiSP(String type) {
        int sotrang = 0;
        Session s = factory.getCurrentSession();
        String hql = "";
        if (type.equals("")) {
            sotrang = 1;
        } else {
            if (type.equals("all")) {
                hql = "From SanPham ";
            } else {
                hql = "From SanPham sp where sp.loai.IDLoai=:idloai";
            }
            Query query = s.createQuery(hql);
            if (!type.equals("all")) {
                query.setParameter("idloai", type);
            }
            List<SanPham> list = query.list();
            //Xu ly so trang
            int maxNumberInPage = 6;
            sotrang = list.size() % maxNumberInPage;
            if (sotrang != 0) {
                sotrang = (list.size() / maxNumberInPage) + 1;
            } else {
                sotrang = list.size() / maxNumberInPage;
            }
        }
        return sotrang;
    }

    //Xu ly Phan Trang
    public int phanTrang(int maxNumberInPage, int id) {
        int firstResult;
        if (id == 1) {
            firstResult = 0;
        } else {
//                id=id-1;
            firstResult = (((id - 1) * maxNumberInPage));
        }
        return firstResult;
    }
    //Xu Ly Comment

    //Insert Comment vao Database
    @RequestMapping("insertComment")
    public String insertComment(CommentBean cmbean) {

        Session s = factory.openSession();
        Transaction t = s.beginTransaction();
        String id = cmbean.getIDSP();
        try {
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh-mm-ss");
            Date date = new Date();
            String chuoi = format.format(date);
            Date ngaycm = format.parse(chuoi);
            SanPham sp = new SanPham();
            sp.setIDSP(id);
            Comment cm = new Comment(cmbean.getName(), cmbean.getMessage(), cmbean.getEmail(), ngaycm, sp, "user.png");
            s.save(cm);
            t.commit();
        } catch (Exception ex) {
            t.rollback();
            System.out.println(ex);
        }
        return "redirect:pageSingle.htm?code=" + id;
    }

    //Show danh sach Commnet theo tung IDSP
    public List<CommentBean> showComment(String id) {
        List<Comment> ds = new ArrayList<>();
        List<CommentBean> listcm = new ArrayList<>();
        try {
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm");
            Session s = factory.getCurrentSession();
            String hql = "From Comment cm where cm.sp.IDSP=:id";
            Query query = s.createQuery(hql);
            query.setParameter("id", id);
            ds = query.list();
            String reply = "";
            String ngayReply = "";
            for (Comment cm : ds) {
                if (cm.getReply() != null) {
                    ngayReply = format.format(cm.getNgayReply());
                    reply = "<div style='height: 90px;border-bottom: 1px solid #E8E8E8;min-height: 50px;min-width: 100px;margin:20px 40px;' class='comment'>"
                            + "<span style='display: block;float: left; margin-right:10px;margin-top: 6px;padding: 10px 10px;border-radius: 100%;'>" + "<img src='images/user.png' /></span>"
                            + "<div style='float: left;'>"
                            + "<p style='font-weight: bold;font-size: 15px;'>Admin</p>"
                            + "<p style='color: gray;'>" + cm.getReply() + "</p>"
                            + "<p style='color: rgba(0,0,0,0.54);font-size: 12px;'>" + ngayReply + "</p>"
                            + "</div>"
                            + "</div>";
                } else {
                    ngayReply = "";
                    reply = "";
                }
                CommentBean cmbean = new CommentBean(cm.getTenKH(), cm.getEmail(), cm.getMoTa(), format.format(cm.getNgayCM()), cm.getURL(), reply, ngayReply);
                listcm.add(cmbean);
                System.out.println(format.format(cm.getNgayCM()));
            }

        } catch (Exception ex) {
            System.out.println(ex);
        }
        return listcm;
    }

    //Get danh sach Code
    public String[] getCode(String code) {
        String[] s = code.split("@");
        return s;
    }

    //Xu ly Gio hang
    @RequestMapping("getGioHang")
    public String getGioHang(ModelMap model, HttpServletRequest request, HttpSession session) {
        String id = request.getParameter("id");
        String sum = request.getParameter("sum");
        String ck = request.getParameter("ck");
        List<SanPham> dssp = new ArrayList<>();
        GioHang gh = new GioHang();
        List<GioHang> dsgh = gh.getGh();
        try {
            Cookie[] cookies = request.getCookies();

            for (Cookie c : cookies) {
                System.out.println("Cookies Name: " + c.getName());
                System.out.println("Cookies Value: " + c.getValue());
            }
            if (ck == null) {
                ck = "false";
            }
            if (id == null) {
                id = "all";
            }
            System.out.println("GioHang: " + id);
            System.out.println("CHECK: " + ck);
            String sz = request.getParameter("size");
            if (sz == null) {
                sz = getSize(id);
            }
            Session s = factory.getCurrentSession();
            String hql = "From SanPham sp where sp.IDSP=:id";
            Query query = s.createQuery(hql);
            query.setParameter("id", id);
            dssp = query.list();
            if (!dssp.isEmpty()) {
                double tongtien = 0;
                int alert = 0;
                int soluong = 0;
                int sl = 0;
                String st = request.getParameter("st");
                List<SlideBean> listurl = new ArrayList<>();
                String[] url = dssp.get(0).getHinhSP().split(";");
                for (SanPham sp : dssp) {
                    sl = 1;
                    String ch = request.getParameter("sl");
                    if (ch != null) {
                        soluong = Integer.parseInt(ch);
                    } else {
                        soluong = 0;
                    }
                    System.out.println("SoLuong: " + soluong);
                    int dem = 0;
                    double giaspkm = sp.getGiaSPKM();
                    double giasp = sp.getGiaSP();
                    if (giaspkm != 0) {
                        giasp = giaspkm;
                    }
                    int size = dsgh.size();
                    for (int i = 0; i < dsgh.size(); i++) {
                        sl = dsgh.get(i).getSoluong();

                        if (dsgh.get(i).getIDSP().equals(id) && dsgh.get(i).getSize().equals(sz) && st == null) {
                            if (soluong > 0) {
                                System.out.println("ID: " + i);
                                sl = soluong;
                            } else {
                                if (soluong == -1) {
                                    System.out.println("DSGH: " + dsgh.size());
                                    if (dsgh.size() > 1) {
//                                        System.out.println("Size > 1");
                                        dsgh.remove(i);
//                                        System.out.println("I: " + i);
                                        System.out.println("SL sau: " + sl);
                                        if (i == dsgh.size()) {
                                            i--;
                                        }
                                        System.out.println("LISTGH: " + dsgh.size());
                                    } else {
                                        dsgh.remove(i);
                                        model.addAttribute("tongtien", 0);
                                        if (ck.equals("all")) {
                                            return "checkout";
                                        }
                                        return "cartDetail";
                                    }
                                }
                                if (soluong == 0) {
                                    sl++;
                                }
//                                    dsgh.remove(i);
//                                    System.out.println("TongTien: " + tongtien);
                            }
                            System.out.println("SIZE: " + sz);
                            if (sl > 5) {
//                            alert = 1;
                                model.addAttribute("stock", "<span style='border:0;color: red;font-style: italic;font-size:12px;width:100%; display:block'>You can't buy more than 5 products! Please, contact us for more information.</span>");
                                sl = 5;
                            } else {
                                model.addAttribute("stock", "<span style='border:0;color: red;font-style: italic;font-size:12px;width:100%;'></span>");
                            }
                            request.setAttribute("idsp", dsgh.get(i).getIDSP());
                            model.addAttribute("IDSP", dsgh.get(i).getIDSP());
                            if (soluong != -1) {
                                giasp = giasp * sl;
                                dsgh.get(i).setSoluong(sl);
                                dsgh.get(i).setGiaSP(giasp);
                                tongtien = tongtien + giasp;
                            }
                            sum = String.valueOf(tongtien);
//                            model.addAttribute("tongtien", tongtien);
                            dem = 1;

                        } else {
                            System.out.println("Continue 3");
                            System.out.println("DEM: " + dem);
                            sl = soluong;
                            System.out.println("SL: " + soluong);
                            tongtien = tongtien + dsgh.get(i).getGiaSP();
                            sum = String.valueOf(tongtien);
//                        model.addAttribute("tongtien", tongtien);
                        }
                    }
                    if (dem == 0) {
                        sl = soluong;
                        System.out.println("Size: " + sz);
                        tongtien = tongtien + giasp;
                        sum = String.valueOf(tongtien);
                        GioHang ghang = new GioHang(id, sp.getHinhSP(), sp.getTenSP(), giasp, sl, tongtien, sp.getLoai().getIDLoai(), sz);
                        dsgh.add(ghang);
                    }
                    System.out.println("DSLIST: " + dsgh.size());
                    System.out.println("SL: " + sl);
                    System.out.println("TongTien: " + tongtien);
                    System.out.println("Alert: " + alert);
                }
                model.addAttribute("tongtien", sum);
                model.addAttribute("listsp", dssp);
                model.addAttribute("soluong", sl);
                model.addAttribute("tongtien", tongtien);
                model.addAttribute("sumCart", dsgh.size());
                session.setAttribute("list", dsgh);
                model.addAttribute("listcart", dsgh);
                if (ck.equals("single")) {
                    if (st != null) {
                        model.addAttribute("soluong", sl);
                    }
                    for (int i = 0; i < url.length; i++) {
                        SlideBean slide = new SlideBean(url[i]);
                        listurl.add(slide);
                    }
                    System.out.println("SIZE: " + sz);
                    model.addAttribute("tongtien", tongtien);
                    model.addAttribute("listurl", listurl);
                    model.addAttribute("listcart", dsgh);
                    return "single";
                }
                System.out.println("Continue 2");
                if (ck.equals("all")) {
                    double sumMoney = 0;
                    for (int i = 0; i < dsgh.size(); i++) {
                        sumMoney = sumMoney + dsgh.get(i).getGiaSP();
                        System.out.println("ABCDEF");
                    }
                    model.addAttribute("sumCart", dsgh.size());
                    model.addAttribute("tongtien", "$" + sum);
                    model.addAttribute("listcart", dsgh);
                    System.out.println("TrueGH: " + dsgh.size());
                    return "checkout";
                }
            } else {
                if (ck.equals("all")) {
                    double sumMoney = 0;
                    for (int i = 0; i < dsgh.size(); i++) {
                        sumMoney = sumMoney + dsgh.get(i).getGiaSP();
                        System.out.println("ABCDEF");

                    }
                    model.addAttribute("sumCart", dsgh.size());
                    model.addAttribute("tongtien", sumMoney);
                    model.addAttribute("listcart", dsgh);
                    System.out.println("TrueGH: " + dsgh.size());
                    return "checkout";
                }
            }
            return "cartDetail";

        } catch (Exception ex) {
            System.out.println(ex);
        }

        return "checkout";
    }

    //Lấy size của một SP
    public String getSize(String id) {
        Session s = factory.getCurrentSession();
        String size = "";
        try {
            String hql = "From Kho k where k.sp.IDSP=:id";
            Query query = s.createQuery(hql);
            query.setParameter("id", id);
            List<Kho> ds = query.list();
            size = ds.get(0).getSize();
            String[] chSize = size.split(";");
            size = chSize[0];
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return size;
    }

    @RequestMapping("payment")
    public String payment(HttpServletRequest request, CTHDBean cthd) {
        Session s = factory.getCurrentSession();
        try {
            System.out.println("Address: " + cthd.getDiaChi());
            String idsp = "";
            String tensp = "";
            String sl = "";
            String size = "";
            String gia = "";
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            Date d = new Date();
            String chuoingay = format.format(d);
            Date ngaymua = format.parse(chuoingay);
            System.out.println("NgayMua: " + chuoingay);
            String idhd = "";
            String hql = "From HoaDon";
            Query query = s.createQuery(hql);
            List<HoaDon> ds = query.list();
            int dshd = 0;
            if (ds.size() == 0) {
                dshd = 1;
            } else {
                dshd = ds.size() + 1;
            }
            idhd = "HD" + dshd;
            GioHang gh = new GioHang();
            List<GioHang> g = gh.getGh();
            List<CTHDBean> dshdbean = new ArrayList<>();
            double tongtien = 0;
            for (int i = 0; i < g.size(); i++) {
                tongtien = tongtien + (g.get(i).getGiaSP());
                idsp = idsp + String.valueOf(g.get(i).getIDSP()) + "^";
                tensp = tensp + String.valueOf(g.get(i).getTenSP()) + "^";
                sl = sl + String.valueOf(g.get(i).getSoluong()) + "^";
                size = size + String.valueOf(g.get(i).getSize()) + "^";
                gia = gia + String.valueOf(g.get(i).getGiaSP()) + "^";
            }
            System.out.println("IDHD: " + idhd);
            System.out.println("IDSP: " + idsp);
            System.out.println("TenSP: " + tensp);
            System.out.println("SoLuong: " + sl);
            System.out.println("Size: " + size);
            System.out.println("Gia: " + gia);
            HoaDon ct = new HoaDon(idhd, ngaymua, "COD", "Xuất", tensp, idsp, sl, size, gia, cthd.getTenKH(), cthd.getSDT(), cthd.getDiaChi(), cthd.getEmail(), "In Process", tongtien);
            savePayment(ct);

        } catch (Exception ex) {
            System.out.println(ex);
        }
        return "index";
    }

    public void savePayment(HoaDon ct) {
        Session s = factory.openSession();
        Transaction t = s.beginTransaction();
        try {
            s.save(ct);
            t.commit();

        } catch (Exception ex) {
            t.rollback();
            System.out.println(ex);
        }
    }
}
