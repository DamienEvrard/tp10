/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controlleur.*;
import DAO.discountDAO;
import Entitie.DiscountEntity;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 *
 * @author damie
 */

@WebServlet(name = "discount", urlPatterns = {"/discount_disp"})
public class discount_Code_Disp extends HttpServlet {

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		DataSource myDataSource = DataSourceFactory.getDataSource();
                discountDAO dao = new discountDAO(myDataSource);
                
                Properties resultat = new Properties();
                resultat.put("records", dao.findDiscountCode());

		try (PrintWriter out = response.getWriter()) {
			
                        response.setContentType("application/json;charset=UTF-8");
			
                        Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String gsonData = gson.toJson(resultat);
			out.println(gsonData);
		}
        }
        
           
 
        
        
	 
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		processRequest(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
                processRequest(request, response);
	}

    
}
