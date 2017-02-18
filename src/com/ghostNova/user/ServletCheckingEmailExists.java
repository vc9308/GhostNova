package com.ghostNova.user;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by victor on 6/16/16.
 */
@WebServlet(name = "ServletCheckingEmailExists")
public class ServletCheckingEmailExists extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println(this.getClass());
        PrintWriter out = response.getWriter();
        String email = new String();
        email = request.getParameter("email");
        UserDAO dao = UserDAOFactory.getUserDAOInstance();
        try {
            if (dao.emailExits(email)) {
                out.print("False");
            } else {
                out.print("True");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
