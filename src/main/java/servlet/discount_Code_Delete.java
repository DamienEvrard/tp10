/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controlleur.*;
import DAO.discountDAO;
import Entitie.DiscountEntity;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
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

@WebServlet(name = "discount", urlPatterns = {"/discount_Del"})
public class discount_Code_Delete extends HttpServlet {

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		
            
            DataSource myDataSource = DataSourceFactory.getDataSource();
                discountDAO dao = new discountDAO(myDataSource);
                
                    int ok=dao.deleteDiscountCode(request.getParameter("DC").toString());
                    String message;
                    if(ok==1){
                        message="Le code "+request.getParameter("DC").toString()+" a ete supprime";
                        request.setAttribute("message", message);
                    }else{
                       message="Le code "+request.getParameter("DC").toString()+" ne peut pas etre supprime"; 
                       request.setAttribute("message", message);
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
