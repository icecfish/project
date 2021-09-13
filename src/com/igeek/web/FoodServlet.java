package com.igeek.web;

import com.igeek.pojo.Catelog;
import com.igeek.pojo.Food;
import com.igeek.pojo.Page;
import com.igeek.service.CatelogService;
import com.igeek.service.CatelogServicerImpl;
import com.igeek.service.FoodService;
import com.igeek.service.FoodServiceImpl;
import com.igeek.utils.JDBCUtils;
import com.igeek.utils.WebUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.nio.file.attribute.FileTime;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.UUID;

/**
 * @auther zcb
 * @create 2021-08-03 19:06
 */
@MultipartConfig
@WebServlet(name = "FoodServlet", urlPatterns = "/foodServlet")
public class FoodServlet extends BaseServlet {
    private FoodService foodService = new FoodServiceImpl();
    private CatelogService catelogService = new CatelogServicerImpl();
//管理员管理菜品时获取菜品分页
    protected void page(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = null;
        try {
            conn = JDBCUtils.getConnectiondruid();
//            System.out.println("报错了吗111111");
            int pageNo = WebUtils.parseInt(req.getParameter("pageNo"), 1);
//            System.out.println(pageNo);
            int pageSize = WebUtils.parseInt(req.getParameter("pageSize"), Page.PAGE_SIZE);

            List<Catelog> catelog = catelogService.getAllCatelog(conn);
            req.getSession().setAttribute("catelog", catelog);
//            System.out.println(pageSize);
//            req.getAttribute("")
            Page<Food> page = foodService.page(conn, pageNo, pageSize);

//            System.out.println(page);
            req.setAttribute("page", page);
            req.getRequestDispatcher("/pages/manager/food_manager.jsp").forward(req, resp);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            JDBCUtils.closeConnection(conn);
        }
    }
//添加菜品
    protected void add(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int pageNo = WebUtils.parseInt(req.getParameter("pageNo"), 0);
        pageNo += 1;
        Connection conn = null;
        try {
            conn = JDBCUtils.getConnectiondruid();

            String imgPath = null;

            String foodname = req.getParameter("foodname");
            String foodinfo = req.getParameter("foodinfo");
            double price = Double.parseDouble(req.getParameter("price"));
            String catelog = req.getParameter("catelog");

            Part file = req.getPart("imgpath");
            if (file != null) {
                String oldName = file.getHeader("content-disposition");
                if (oldName != null && oldName.indexOf(".") > 0) {
                    String newName = UUID.randomUUID() + oldName.substring(oldName.lastIndexOf("."), oldName.length() - 1);
                    imgPath = "/img/" + newName;
                    file.write("E:\\javacode\\img\\" + newName);
                }
            }
            Catelog catelog1 = catelogService.getCatelog(conn, catelog);

            Food food = new Food(null, foodname, foodinfo, price, imgPath, catelog1.getId());
//            System.out.println(food);
//            Food food = WebUtils.copyParamToBean(req.getParameterMap(),new Food());

            foodService.addFood(conn, food);

            resp.sendRedirect(req.getContextPath() + "/foodServlet?action=page&pageNo=" + pageNo);
        } catch (Exception throwables) {
            throwables.printStackTrace();
        } finally {
            JDBCUtils.closeConnection(conn);
        }
    }
//删除菜品
    protected void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = null;
        try {
            conn = JDBCUtils.getConnectiondruid();
            int id = WebUtils.parseInt(req.getParameter("id"), 0);
            foodService.deleteFoodById(conn, id);
            resp.sendRedirect(req.getContextPath() + "/foodServlet?action=page&pageNo=" + req.getParameter("pageNo"));

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            JDBCUtils.closeConnection(conn);
        }
    }
//修改前获取菜品信息
    protected void getFood(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = null;
        try {
            conn = JDBCUtils.getConnectiondruid();
            int id = WebUtils.parseInt(req.getParameter("id"), 0);
            Food food = foodService.queryFoodById(conn, id);

            List<Catelog> catelog = catelogService.getAllCatelog(conn);
//            System.out.println(catelog);
            req.getSession().setAttribute("catelog", catelog);

            req.setAttribute("food", food);
            req.getRequestDispatcher("/pages/manager/food_edit.jsp").forward(req, resp);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            JDBCUtils.closeConnection(conn);
        }
    }

//修改菜品
    protected void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = null;
        try {
            conn = JDBCUtils.getConnectiondruid();
//            Food food = WebUtils.copyParamToBean(req.getParameterMap(), new Food());
            int id = Integer.parseInt(req.getParameter("id"));
            String imgPath=null;
            String foodname = req.getParameter("foodname");
            String foodinfo = req.getParameter("foodinfo");
            double price = Double.parseDouble(req.getParameter("price"));
            String catelog = req.getParameter("catelog");
            System.out.println(catelog);
            Catelog catelog1 = catelogService.getCatelog(conn, catelog);
            System.out.println(catelog1);
            Part file = req.getPart("imgpath");
            if (file != null) {
                String oldName = file.getHeader("content-disposition");
                if (oldName != null && oldName.indexOf(".") > 0) {
                    String newName = UUID.randomUUID() + oldName.substring(oldName.lastIndexOf("."), oldName.length() - 1);
                    imgPath = "/img/" + newName;
                    file.write("E:\\javacode\\img\\" + newName);
                }
            }



            Food food = new Food(id, foodname, foodinfo, price, imgPath, catelog1.getId());
//            System.out.println(food);
            foodService.updateFood(conn, food);

            resp.sendRedirect(req.getContextPath() + "/foodServlet?action=page&pageNo=" + req.getParameter("pageNo"));
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            JDBCUtils.closeConnection(conn);
        }

    }
//菜品全部显示（已不用）
    protected void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = null;
        try {
            conn = JDBCUtils.getConnectiondruid();
            List<Food> foods = foodService.queryFoods(conn);
            req.setAttribute("foods", foods);
            req.getRequestDispatcher("/pages/manager/food_manager.jsp").forward(req, resp);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            JDBCUtils.closeConnection(conn);
        }
    }
    //菜品详情前获取菜品信息
    protected void getFood1(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = null;
        try {
            conn = JDBCUtils.getConnectiondruid();
            int id = WebUtils.parseInt(req.getParameter("id"), 0);
            String pageNo = req.getParameter("pageNo");
            Food food = foodService.queryFoodById(conn, id);
            List<Catelog> catelog = catelogService.getAllCatelog(conn);
            System.out.println(catelog);
            req.setAttribute("pageNo",pageNo);
            req.getSession().setAttribute("catelog",catelog);
            req.setAttribute("food",food);
            req.getRequestDispatcher("/pages/client/goods.jsp").forward(req,resp);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            JDBCUtils.closeConnection(conn);
        }
    }

}
