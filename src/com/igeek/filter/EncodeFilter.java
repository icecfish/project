package com.igeek.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;


//编码级过滤器
//urlPatterns  当前过滤器Filter对哪一些请求做处理
//initParams   当前过滤器的初始化参数
@WebFilter(filterName = "f1",urlPatterns = "/*",
        initParams = @WebInitParam(name="encode",value = "UTF-8"))
public class EncodeFilter implements Filter {


    private String encode;

    public void destroy() {
//        System.out.println("EncodeFilter destroy");
    }


    //过滤器中真正做过滤的方法
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
//        System.out.println("EncodeFilter doFilter");

        //请求的编码集处理
        HttpServletRequest request = (HttpServletRequest)req;
        request.setCharacterEncoding(encode);

        String uri = request.getRequestURI();
        if(uri.contains("css") || uri.contains("js")){
            chain.doFilter(request, resp);
            return;
        }
        //响应的编码集处理  json数据
        resp.setContentType("text/html;charset="+encode);
        //过滤链：有可能下一个资源是目标资源，也有可能下一个资源还是过滤器
        chain.doFilter(request, resp);
    }

    public void init(FilterConfig config) throws ServletException {
//        System.out.println("EncodeFilter init");
        //获取当前过滤器的初始化参数的值
        encode = config.getInitParameter("encode");
//        System.out.println("encode = "+encode);

    }

}
