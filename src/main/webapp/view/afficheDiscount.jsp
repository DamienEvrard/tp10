<%-- 
    Document   : afficheDiscount
    Created on : 5 nov. 2019, 13:49:19
    Author     : damie
--%>
<!– JSP --!>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"/>
        <script>
            $(document).ready( 
                function(){$("#doDelete").click(supr)}
                function(){$("#doAdd").click(add)}
            );
    
            function actionSupr(){
                
            }
            
            function actionAdd(){
                
            }
            
            function actionError(){
                
            }
    
    
            function supr(){
                $.ajax({
                    url: "afficheDiscount",
                    success: actionSupr,
                    error: actionError
                })
            }
            
            function add(){
                $.ajax({
                    url: "afficheDiscount",
                    success: actionAdd,
                    error: actionError
                })
            }
                
        </script>
    </head>
    <body>		
        <h1>Edition des taux de remise</h1>
            Code : <input id="code" name="code" size="1" maxlength="1" pattern="[A-Z]{1}+" title="Une lettre en MAJUSCULES"><br/>
            Taux : <input id="taux" name="taux" type="number" step="0.1" min="0.0" max="99.9" size="5"><br/>
            <input id="doAdd" value="Ajouter">
        <p>${message}</p>
        <table border="1">
            <tr><td>Code</td><td>Taux</td><td>Action</td></tr>
            <c:forEach var="dc" items="${Discount}">
                <tr>
                    <td>${dc.discount_code}</td>
                    <td>${dc.rate}</td>
                    <td>
                        <input type="hidden" id="ID" value="${dc.discount_code}">
                        <input id=""doDelete value="Delete"/></td>
                </tr>
            </c:forEach>
            
        </table>
        
    </body>
</html>