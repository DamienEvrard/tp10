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
                    function(){
                               fillTab()
                               $("#doDelete").click(supr)
                               $("#doAdd").click(add)}
            );
                    function fillTab() {
                   
                    $.ajax({
                    url: "discount_disp",
                            dataType: "json",
                            error: actionError,
                            success: 
                            function(result) {
                                    var tableau = ${'table'};
                                    $.each(result.records,
                                            function(discount_codeIndex) {
                                            
                                            var dc = result.records[discount_code];
                                            var rate = result.records[rate];
                                            var row = "<tr><td>"+dc+"</td><td>"+rate+"</td></tr>";
                                            tableau.append(row);
                                            }
                                    );
                                    
                                    showTab();
                            }
                    });
                    }
                    function showtab() {	
				$.ajax({
					url: "discount",
					dataType: "json",
						function(result) {
                                                    $("#table").empty();
                                                    $.jsontotable(result.records, {id: "#table", header: false});
						},
					error: showError
				});
                    }

            function actionSupr(){


            $("#doDelete").prop("disabled", false);
            }

            function actionAdd(){


            $("#doAdd").prop("disabled", false);
            }

            function actionError(xhr, status, message){
            $("#message").html("Erreur " + status + " : " + message)
            }


            function supr(){
                var ID= $
            $.ajax({
            url: "Discount_Del",
                    data: { "id" : ID },
                    dataType: "json",
                    success:
                    function(result) {
                    $("#id").empty();
                            $.jsontotable(result.records, {id: "#id", header: false});
                    },
                    error: actionError
            });
                    $("#doDelete").prop("disabled", true);
            }

            function add(){
            $.ajax({
            url: "Discount_Add",
                    data: { "state" : "add" },
                    dataType: "json",
                    success: actionAdd,
                    error: actionError
            });
                    $("#doAdd").prop("disabled", true);
            }

        </script>
    </head>
    <body>		
        <h1>Edition des taux de remise</h1>
        Code : <input id="code" name="code" size="1" maxlength="1" pattern="[A-Z]{1}+" title="Une lettre en MAJUSCULES"><br/>
        Taux : <input id="taux" name="taux" type="number" step="0.1" min="0.0" max="99.9" size="5"><br/>
        <input type="submit" id="doAdd" value="Ajouter">
        <p id="message">${message}</p>
        <table border="1" id="table">
            <tr><td>Code</td><td>Taux</td><td>Action</td></tr>
            <c:forEach var="dc" items="${Discount}">
                <tr>
                    <td>${dc.discount_code}</td>
                    <td>${dc.rate}</td>
                    <td>
                        <input type="hidden" id="ID" value="${dc.discount_code}">
                        <input type="submit" id="doDelete" value="Delete"/></td>
                </tr>
            </c:forEach>

        </table>

    </body>
</html>
