<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Login</title>
<style type="text/css">
form {
	text-align: center;
}
body {
	background-color: #0CF;
}
div {
	text-align: center;
}
</style>
</head>

<body>
	
   <%
   		 try{
			
			Class.forName("org.postgresql.Driver");
			Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost/javaee","postgres","123");
			//out.println("Conexão com sucesso");
			PreparedStatement ps = conn.prepareStatement("select * from login where nome = ? and senha = ?", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                        
                        String usuario = request.getParameter("usuario");
                        String senha = request.getParameter("senha");
                        ps.setString(1, usuario);
                        ps.setString(2, senha);
                        ResultSet rs = ps.executeQuery();
                       
                        if(usuario != null && senha != null){
                        if(rs.first()){
                            
                            out.println("Bem vindo ao sistema");
                        }else{
                            
                            out.println("Senha ou usuario incorreto");
                        }
                                            }
                        
                       
			 
		 }catch(Exception e){
			
			out.println("Erro :"+e.getMessage()); 
		 }
   
   %>
    

   <div><img src="imagens/contas.jpg" width="405" height="165" />
   </div>
   <form id="form1" name="form1" method="post" action="index.jsp">
     <p>Usuário   
       <label  for="Usuario"></label>
     <input name="usuario" type="text" name="Usuario" id="Usuario" />
     Senha
     <label for="Senha"></label>
     <input name="senha" type="password" name="Senha" id="Senha" />
     <input type="submit" name="Logar" id="Logar" value="Logar" />
     </p>
     <p>&nbsp;</p>
   </form>
   <p>&nbsp;</p>
   
   
</body>
</html>