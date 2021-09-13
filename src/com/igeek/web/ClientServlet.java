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

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @auther zcb
 * @create 2021-08-04 12:00
 */
@WebServlet(name = "ClientServlet", urlPatterns = "/clientServlet")
public class ClientServlet extends BaseServlet{
    private FoodService foodService= new FoodServiceImpl();
    private CatelogService catelogService=new CatelogServicerImpl();
    //首页显示分页
    protected void page(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = null;
        try {
            conn = JDBCUtils.getConnectiondruid();
//            System.out.println("报错了吗111111");
            int pageNo = WebUtils.parseInt(req.getParameter("pageNo"), 1);
//            System.out.println(pageNo);
            int pageSize = WebUtils.parseInt(req.getParameter("pageSize"), Page.PAGE_SIZE);
//            System.out.println(pageSize);

            Page<Food> page = foodService.page(conn,pageNo,pageSize);
            List<Catelog> catelog = catelogService.getAllCatelog(conn);
            req.getSession().setAttribute("catelog",catelog);

//            System.out.println(page);
            req.setAttribute("page",page);
            req.getRequestDispatcher("/pages/client/index.jsp").forward(req,resp);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            JDBCUtils.closeConnection(conn);
        }
    }
//插叙分页
    protected void pageForSearch(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = null;
        try {
            conn = JDBCUtils.getConnectiondruid();

            String search = req.getParameter("search");
            if(search==null){
                page(req,resp);
            }else {
                int pageNo = WebUtils.parseInt(req.getParameter("pageNo"), 1);

                int pageSize = WebUtils.parseInt(req.getParameter("pageSize"), Page.PAGE_SIZE);

                List<Catelog> catelog = catelogService.getAllCatelog(conn);
                req.getSession().setAttribute("catelog", catelog);

                Page<Food> page = foodService.pageForSearch(conn,search,pageNo, pageSize);


                req.setAttribute("page", page);
                req.setAttribute("search",search);
                req.getRequestDispatcher("/pages/client/index.jsp").forward(req, resp);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            JDBCUtils.closeConnection(conn);
        }
    }
}
