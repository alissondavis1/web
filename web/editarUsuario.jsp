<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Alteração de Usuário</title>
<style>
body>p {
	text-align: center;
    color: blue;
    font-size: 36px;
}

#labelSenha, #senha{
   position:relative;
	left:50px;
}
#form1 {
	text-align: center;
	border: 2px double black;
}
#labelCodigo, #codigo{
 position:relative;
 left:-35px;
	
}
#labelNivelAcesso, #nivelAcesso{
	
position:relative;
}
#gravar{
	position: absolute;
	left: 450px;
	top: 225px;
	width: 132px;
	height: 27px;
}
#limpar{
	position: absolute;
	left: 615px;
	top: 225px;
	height: 27px;
}
</style>

</head>

<body>
    
    <%
    
       
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs;
	 try{
			
			//Class.forName("org.postgresql.Driver");
			conn = DriverManager.getConnection("jdbc:postgresql://localhost/javaee","postgres","123");
                        
                        if(request.getParameter("acao") != null){
                            
                            if(request.getParameter("acao").equals("alterar")  && !request.getParameter("usuario").equals("") && !request.getParameter("senha").equals("") && !request.getParameter("nivelAcesso").equals("")){
                                
                                ps = conn.prepareStatement("update login set nome = ?, senha = ?, nivel =? where id =?");
                                ps.setString(1, request.getParameter("usuario"));
                                ps.setString(2, request.getParameter("senha"));
                                ps.setString(3, request.getParameter("nivelAcesso"));
                                ps.setInt(4, Integer.parseInt(request.getParameter("codigo")));
                                ps.executeUpdate();
                                response.sendRedirect("usuario.jsp"); 
                            }
                            
                        }
          
    %>
    
<p>Alteração de Usuário</p>
<form id="form1" name="frmEditarUsuario" method="post" action="editarUsuario.jsp?acao=alterar&codigo=<%=request.getParameter("codigo")%>">
  <p>
    <label for="codigo" id="labelCodigo">Código.:</label>
    <input name="codigo" type="text" id="codigo" size="6" maxlength="5" disabled="disabled" value="<%=request.getParameter("codigo")%>"/>
    <label for="nivelAcesso" id="labelNivelAcesso">Nivel de Acesso.:</label>
    <input name="nivelAcesso" type="text" id="nivelAcesso" size="1" maxlength="1" value="<%=request.getParameter("nivelAcesso")%>"/>
  </p>
  <p>
    <label for="usuario">Usuário.:</label>
    <input type="text" name="usuario" id="usuario" maxlength="10" size="15" value="<%=request.getParameter("usuario")%>"/>
    
    <label for="senha" id="labelSenha">Senha.:</label>
    <input type="password" name="senha" id="senha" maxlength="10" size="15" value="<%=request.getParameter("senha")%>"/>
  </p>
  <p>
    <input type="submit" name="gravar" id="gravar" value="Confirmar Alteração" />
    <input type="reset" name="limpar" id="limpar" value="LimparCampos" />
  </p>
</form>
            
            <%
                                                       }
         catch(Exception e){
             
             out.print(e.getMessage());
         }finally{
             
             if(conn != null){
                 conn.close();
             }
             if(ps != null){
                 ps.close();
                 
             }
         }
    %>
<p>&nbsp;</p>
</body>
</html>