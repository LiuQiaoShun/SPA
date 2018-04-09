package online.qsx.servlet;

import online.qsx.server.impl.UserServerImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
//http://localhost:8080/SPA/userServlet
@WebServlet("/userServlet")
public class UserServlet extends HttpServlet {
    UserServerImpl userServerImpl=new UserServerImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String op=req.getParameter("op");
        //http://localhost:8080/SPA/userServlet?op=to_login
        if("to_login".equals(op)){
            req.getRequestDispatcher("/login.jsp").forward(req,resp);
        }else if("do_login".equals(op)){
            String username=req.getParameter("username");
            String password=req.getParameter("password");
            if(userServerImpl.login(username,password)){
                req.setAttribute("mess","µÇÂ¼³É¹¦");
                req.getRequestDispatcher("/index.jsp").forward(req,resp);
            }else{
                req.setAttribute("mess","µÇÂ¼Ê§°Ü");
                req.getRequestDispatcher("/login.jsp").forward(req,resp);
            }
        }
    }
}
