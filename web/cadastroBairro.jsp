<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Cadastro de Usuários</title>
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
 left:-75px;
	
}
#labelNivelAcesso, #nivelAcesso{
	
position:relative;
}
#gravar{
	position: absolute;
	left: 408px;
	top: 223px;
	width: 57px;
	height: 27px;
}
#limpar{
	position: absolute;
	left: 495px;
	top: 225px;
}
</style>

</head>

<body>
    
    <%
    
       
    Connection conn = null;
    PreparedStatement ps = null;
	 try{
			
			//Class.forName("org.postgresql.Driver");
			conn = DriverManager.getConnection("jdbc:postgresql://localhost/javaee","postgres","123");
                        
                        if(request.getParameter("acao") != null){
                            
                            if(request.getParameter("acao").equals("inserir")  && !request.getParameter("nome").equals("")){
                                
                                ps = conn.prepareStatement("insert into bairro(nome) values(?)");
                                ps.setString(1, request.getParameter("nome"));
                              
                                ps.executeUpdate();
                                response.sendRedirect("bairro.jsp"); 
                            }
                            
                        }
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
    
<p>Cadastro de Usuários</p>
<form id="form1" name="frmInserirUsuario" method="post" action="cadastroBairro.jsp?acao=inserir">

  <p>
    <label for="usuario">Nome.:</label>
    
    <input type="text" name="nome" id="nome" maxlength="25" size="25"/>
    
  </p>
  <p>
    <input type="submit" name="gravar" id="gravar" value="Gravar" />
    <input type="reset" name="limpar" id="limpar" value="LimparCampos" />
  </p>
</form>
<p>&nbsp;</p>
</body>
</html>