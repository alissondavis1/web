<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Relatório de Bairro</title>
<style type="text/css">



td {

	text-align:center;	
}

body>p {
	text-align: center;
    color: blue;
    font-size: 36px;
}
div>p {
	text-align: center;
}
#imprimir{
	position: relative;
	left: 280px;
}
#ordenação{
	color: blue;
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	font-weight: bold;
}


a:visited{
    
    color:blue;
}


</style>
</head>

<body>
<p>Bairros</p>


<div>

<table width="430" border="1" align="center">
  <tr>
    <td width="95" height="45" bgcolor="#CCCCCC">Código</td>
    <td width="107" bgcolor="#CCCCCC">Nome</td>
    
    </tr>
    <%
    
    Connection conn = null;
    PreparedStatement ps = null;
	 try{
			
			//Class.forName("org.postgresql.Driver");
			conn = DriverManager.getConnection("jdbc:postgresql://localhost/javaee","postgres","123");
			//out.println("Conexão com sucesso");
			ResultSet rs = null;
                        
                     
                      
                       
                        ps = conn.prepareStatement("select * from bairro");									  
                        rs = ps.executeQuery();  
                       
                       
                       while(rs.next()){
                            
                           %>
  <tr>
      <td height="35"><%=rs.getInt("codigo") %> </td>
      <td><%=rs.getString("nome") %></td>
    
    </tr>
     <%
       }
         }
         catch(Exception e){
         
         out.println("Erro: "+e.getMessage());
         
     }finally{
         if(conn != null){
         conn.close();
                 }
         if(ps != null){
         ps.close();
             }
         }

                           
 %>
  
</table>
<p>
    
    <input type="button" name="Imprimir" id="Imprimir" value="Imprimir" onclick="window.print()" />
</p>
<p>&nbsp;</p>
</div>

</body>
</html>