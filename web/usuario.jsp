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
	left: 185px;
}


</style>
</head>

<body>
<p>Manutenção de Usuários</p>


<div>
<p><img src="imagens/cadastro.png" width="128" height="128" /></p>
<table width="518" border="1" align="center">
  <tr>
    <td width="160" height="45">Código</td>
    <td width="160">Usuário</td>
    <td width="160">Senha</td>
    <td width="160">Nivel de Acesso</td>
  </tr>
    <%
	 try{
			
			//Class.forName("org.postgresql.Driver");
			Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost/javaee","postgres","123");
			//out.println("Conexão com sucesso");
			PreparedStatement ps = conn.prepareStatement("select * from login", ResultSet.TYPE_SCROLL_INSENSITIVE, 			     		ResultSet.CONCUR_READ_ONLY);
                        
                       
                      
                        ResultSet rs = ps.executeQuery();
                       
                       
                       while(rs.next()){
                            
                           %>
  <tr>
      <td height="35"><%=rs.getInt("id") %> </td>
      <td><%=rs.getString("nome") %></td>
    <td><%=rs.getString("senha") %></td>
    <td><%=rs.getString("nivel")%></td>
  </tr>
     <%
       }
         }
         catch(Exception e){
         
         out.println("Erro: "+e.getMessage());
         
     }

                           
 %>
  
</table>
<p><img src="imagens/icon_objectives.gif"  width="48" height="48" /><img src="imagens/delete.png" width="48" height="48" /><img id="imprimir" src="imagens/icone_imprimir.jpg" width="48" height="48" /></p>
<p>&nbsp;</p>
</div>
<p>&nbsp;</p>
</body>
</html>