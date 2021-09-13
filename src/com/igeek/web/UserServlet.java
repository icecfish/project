package com.igeek.web;

import com.google.gson.Gson;
import com.igeek.pojo.Admin;
import com.igeek.pojo.Food;
import com.igeek.pojo.User;
import com.igeek.service.*;
import com.igeek.utils.JDBCUtils;
import com.igeek.utils.WebUtils;
import com.google.code.kaptcha.Constants.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY;

@WebServlet(name = "UserServlet", urlPatterns = "/userServlet")

public class UserServlet extends BaseServlet{
    private UserService userService=new UserServiceImpl();
    private AdminService adminService = new AdminServiceImpl();
    private OrderService orderService = new OrderServiceImpl();

//阿贾克斯进行注册时用户名是否存在验证
    protected void ajaxExistsUsername(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = null;
        try {
            conn = JDBCUtils.getConnectiondruid();
            String username = req.getParameter("username");
            boolean existUsername = userService.existUsername(conn, username);
            HashMap<String, Object> resultMap = new HashMap<>();
            resultMap.put("existUsername",existUsername);
            Gson gson = new Gson();
            String json = gson.toJson(resultMap);
            resp.getWriter().write(json);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            JDBCUtils.closeConnection(conn);
        }

    }
//登出
    protected void logout(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        req.getSession().invalidate();
        resp.sendRedirect(req.getContextPath());
    }
    //注册
    protected void regist(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获得session验证码
        String token = (String)req.getSession().getAttribute(KAPTCHA_SESSION_KEY);
        //删除session中的验证码
        req.getSession().removeAttribute(KAPTCHA_SESSION_KEY);

        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String nickname = req.getParameter("nickname");
        String phone = req.getParameter("phone");
        String code = req.getParameter("code");
        User user = WebUtils.copyParamToBean(req.getParameterMap(), new User());
        Connection conn = null;
        try {
            conn = JDBCUtils.getConnectiondruid();
//        2、检查 验证码是否正确
            if (token!=null&&token.equalsIgnoreCase(code)) {
                //        3、检查 用户名是否可用
                if (userService.existUsername(conn,username)) {
                    System.out.println("用户名[" + username + "]已存在!");
                    req.setAttribute("msg","用户名已存在");
                    req.setAttribute("username",username);
                    req.setAttribute("email",email);
                    req.setAttribute("nickname",nickname);
                    req.setAttribute("phone",phone);
                    //        跳回注册页面
                    req.getRequestDispatcher("/pages/user/regist.jsp").forward(req, resp);
                } else {
                    userService.registUser(conn,user);
                    User login = userService.login(conn, user.getUsername(), user.getPassword());
                    req.getSession().setAttribute("user",login);
    //        跳到注册成功页面 regist_success.jsp
                    req.getRequestDispatcher("/index.jsp" ).forward(req, resp);
                }
            } else {
                //回显
                req.setAttribute("msg","验证码错误");
                req.setAttribute("username",username);
                req.setAttribute("email",email);
                req.setAttribute("nickname",nickname);
                req.setAttribute("phone",phone);

//                System.out.println("验证码[" + code + "]错误");
                //        跳回注册页面
                req.getRequestDispatcher("/pages/user/regist.jsp").forward(req, resp);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            JDBCUtils.closeConnection(conn);
        }
    }

//用户登录
    protected void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = null;
        try {
            conn = JDBCUtils.getConnectiondruid();
            String username = req.getParameter("username");
            String password = req.getParameter("password");
            User login = userService.login(conn,username,password);
//            System.out.println(login);
            if(login==null){
                req.setAttribute("msg","用户名或密码错误！");
                req.setAttribute("username",username);
                req.getRequestDispatcher("/pages/user/login.jsp").forward(req,resp);

            }else{
                req.getSession().setAttribute("user",login);
                resp.sendRedirect(req.getContextPath()+"/index.jsp");

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            JDBCUtils.closeConnection(conn);
        }
    }



//管理员登录
    protected void adminlogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = null;
        try {
            conn = JDBCUtils.getConnectiondruid();
            String adname = req.getParameter("adname");
            String password = req.getParameter("password");
            Admin admin = adminService.login(conn, adname, password);
            System.out.println(admin);
            if(admin==null){
                req.setAttribute("msg","管理员或密码错误！");
                req.setAttribute("adname",adname);
                req.getRequestDispatcher("/pages/admin/adminlogin.jsp").forward(req,resp);

            }else{
                req.getSession().setAttribute("admin",admin);
                req.getRequestDispatcher("/foodServlet?action=page").forward(req,resp);

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            JDBCUtils.closeConnection(conn);
        }
    }

    protected void getAll(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = null;
        try {
            conn = JDBCUtils.getConnectiondruid();
            List<User> users = userService.getAllUser(conn);
            Double allPrice = orderService.getALLPrice(conn);
            System.out.println(allPrice);
            for (User user : users) {
                Double userPrice = orderService.getUserPrice(conn, user.getId());
                user.setPassword(String.valueOf(userPrice));
            }
            req.setAttribute("users", users);
            req.setAttribute("allPrice",allPrice);
            req.getRequestDispatcher("/pages/manager/user_manager.jsp").forward(req, resp);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            JDBCUtils.closeConnection(conn);
        }
    }
}
