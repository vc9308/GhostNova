package com.ghostNova.product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspFactory;
import javax.servlet.jsp.PageContext;

import java.util.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.net.InetAddress;

import com.jspsmart.upload.*;

/**
 * Created by victor on 6/20/16.
 */
@WebServlet(name = "ServletProductEdit")
public class ServletProductEdit extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        String productId = new String();
        String userId = new String();
        String productName = new String();
        String category = new String();
        Float price = new Float(0f);
        String payment = new String();
        Integer amount = new Integer(0);
        String imageName = new String();
        String description = new String();
        Integer tradingTimes = new Integer(0);
        String publishDate = new String();
        String editDate = new String();

        Cookie[] cookies = request.getCookies();
        if (cookies !=  null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("userId")) {
                    userId = cookie.getValue();
                }
            }
        }

        String ip = InetAddress.getLocalHost().getHostAddress();
        String ipWithoutDot = ip.replace(".", "");

        String timeStampString = String.valueOf(System.currentTimeMillis());
        String basePath = request.getSession().getServletContext().getRealPath("/ProductImages/");

        SmartUpload smart = new SmartUpload();
        try {
            JspFactory _jspxFactory = null;
            PageContext pageContext = null;
            _jspxFactory = JspFactory.getDefaultFactory();
            pageContext = _jspxFactory.getPageContext(this, request, response, "", true, 8192, true);

            smart.initialize(pageContext);
            smart.upload();
            productId = smart.getRequest().getParameter("productId");
            out.print(productId);
            if (smart.getFiles().getSize() > 0) {
                File file = smart.getFiles().getFile(0);
                String ext = file.getFileExt();
                imageName = productId + "." + ext;
                file.saveAs(basePath + java.io.File.separator + imageName);

                if (file.getSize() > 2000 * 1024) {
                    out.print("image to upload must be less than 2M");
                    out.print("<script>window.history.back()</script>");
                } else if (!(ext.equals("gif") || ext.equals("jpg") || ext.equals("png") || ext.equals("jpeg"))) {
                    out.print("Image to upload must with a valid format (.gif, .jpg, .png, .jpeg)");
                    out.print("<script>window.history.back()</script>");
                }
            }

            productName = smart.getRequest().getParameter("name").trim();
            category = smart.getRequest().getParameter("categories").trim();
            price = Float.parseFloat(smart.getRequest().getParameter("price").trim());
            payment = smart.getRequest().getParameter("payment");
            amount = Integer.parseInt(smart.getRequest().getParameter("amount"));
            imageName = smart.getRequest().getParameter("imageName");
            description = smart.getRequest().getParameter("description");
            tradingTimes = Integer.parseInt(smart.getRequest().getParameter("tradingTimes").trim());
            publishDate = smart.getRequest().getParameter("publishDate");

            DateFormat df = new SimpleDateFormat("MM/dd/yyy HH:mm:ss");
            Date now = Calendar.getInstance().getTime();
            editDate = df.format(now);

            Product product = new Product();
            ProductDAO productDAO = ProductDAOFactory.getProductDAOInstance();
            try {
                product = productDAO.queryByProductId(productId);
            } catch (Exception e) {
                e.printStackTrace();
            }

            product.setProductName(productName);
            product.setCategory(category);
            product.setPrice(price);
            product.setPayment(payment);
            product.setAmount(amount);
            product.setImageName(imageName);
            product.setDescription(description);
            product.setTradingTimes(tradingTimes);
            product.setEditDate(editDate);

            try {
                productDAO.update(product);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } catch (SmartUploadException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
