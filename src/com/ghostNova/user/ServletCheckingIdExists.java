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
@WebServlet(name = "ServletCheckingIdExists")
public class ServletCheckingIdExists extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String id = new String();
        id = request.getParameter("id");
        UserDAO dao = UserDAOFactory.getUserDAOInstance();
        try {
            if (dao.idExits(id)) {
                System.out.println("output 'False'");
                out.print("False");
            } else {
                System.out.println("output 'True'");
                out.print("True");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
