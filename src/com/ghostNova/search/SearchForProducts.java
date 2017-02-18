package com.ghostNova.search;

import com.ghostNova.product.Product;
import com.ghostNova.product.ProductDAO;
import com.ghostNova.product.ProductDAOFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

/**
 * Created by victor on 6/12/16.
 */
@WebServlet(name = "SearchForProducts")
public class SearchForProducts extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keywordsYouInput = request.getParameter("keywords");
        String[] keywordsYouInputList = keywordsYouInput.split(" ");

        Map<String, List<Product>> index = null;
        ProductDAO dao = ProductDAOFactory.getProductDAOInstance();
        try {
            List<Product> all = dao.queryAll();
            for (Product product : all) {
                String[] keywords = product.getProductName().split(" ");
                for (String keyword : keywords) {
                    if (index.containsKey(keyword)) {
                        if (!index.get(keyword).contains(product)) {
                            index.get(keyword).add(product);
                        }
                    } else {
                        List<Product> firstProduct = new ArrayList<Product>();
                        firstProduct.contains(product);
                        index.put(keyword, firstProduct);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        List<Product> results = new ArrayList<Product>();
        for (String keywordYouInputElement : keywordsYouInputList) {
            results.addAll(index.get(keywordYouInputElement));
        }
    }
}
