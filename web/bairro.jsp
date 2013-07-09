<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
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
<p>Manutenção de Bairros</p>


<div>
    <p><a href="cadastroBairro.jsp"><img src="imagens/cadastro.png" width="95" height="87" /></a></p>
<p id="ordenação">Ordenação: <a href="bairro.jsp?ordenacao=codigo">Código </a> - <a href="bairro.jsp?ordenacao=nome">Nome</a></p>
<table width="615" border="1" align="center">
  <tr>
    <td width="95" height="45" bgcolor="#CCCCCC">Código</td>
    <td width="79" bgcolor="#CCCCCC">Nome</td>
  	<td width="88" bgcolor="#CCCCCC">Editar</td>
    <td width="85" bgcolor="#CCCCCC">Excluir</td>
  </tr>
    <%
    
    Connection conn = null;
    PreparedStatement ps = null;
	 try{
			
			//Class.forName("org.postgresql.Driver");
			conn = DriverManager.getConnection("jdbc:postgresql://localhost/javaee","postgres","123");
			//out.println("Conexão com sucesso");
			ResultSet rs = null;
                        
                       if(request.getParameter("acao")!= null){
                          
                          ps = conn.prepareStatement("delete from bairro where codigo = ?");
                           
                           ps.setInt(1 ,Integer.parseInt(request.getParameter("codigo")));
                           ps.executeUpdate();
                       }
                      
                        if(request.getParameter("ordenacao") == null){
                              ps = conn.prepareStatement("select * from bairro");									  
                        rs = ps.executeQuery();  
                       
                        }else if(request.getParameter("ordenacao").equals("codigo")){
                            
                          ps = conn.prepareStatement("select * from bairro order by codigo");									  
                        rs = ps.executeQuery();
                        }else if(request.getParameter("ordenacao").equals("nome")){
                            
                            ps = conn.prepareStatement("select * from bairro order by nome");
                            rs = ps.executeQuery();
                        }
                       while(rs.next()){
                            
                           %>
  <tr>
      <td height="35"><%=rs.getInt("codigo") %> </td>
      <td><%=rs.getString("nome") %></td>
    
    <td><a href="editarBairro.jsp?codigo=<%=rs.getInt("codigo")%>&nome=<%=rs.getString("nome")%>" > <img src="imagens/icon_objectives.gif"  width="48" height="48" /></a></td>
    <td><a href="bairro.jsp?acao=excluir&codigo=<%=rs.getInt("codigo")%>"><img src="imagens/delete.png" width="48" height="48" /></a></td>
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
 <p><a href="#" onclick=window.open("imprimeBairro.jsp") >  <img id="imprimir" src="imagens/icone_imprimir.jpg" width="48" height="48" /></a></p>
<p>&nbsp;</p>
</div>

</body>
</html>