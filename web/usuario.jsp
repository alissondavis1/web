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
</style>
</head>

<body>
<p>Manutenção de Usuários</p>
<form id="form1" name="form1" method="post" action="">
  <p>
    <input type="submit" name="novo" id="novo" value="Novo Registro" />
  </p>
</form>

<div>
<table width="518" border="1" align="center">
  <tr>
    <td width="160" height="55">Código</td>
    <td width="160">Usuário</td>
    <td width="160">Senha</td>
    <td width="160">Nivel de Acesso</td>
  </tr>
  <tr>
    <td height="55">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</div>
</body>
</html>