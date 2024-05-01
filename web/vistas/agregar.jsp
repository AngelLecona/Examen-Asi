<%@ page import="java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../includes/header.jsp" />

<style>
    div{
        height: 400px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }
</style>

<div>
    <h1>Agregar USUARIOS</h1>
<form action="agregarusuario.jsp" method="POST">
    <label>Nombre: </label>
    <input type="text" name="nombre">
    
    <label>Password </label>
    <input type="password" name="contrasena">
    <input class="add" type="submit" value="Agregar">
</form>
</div>
<jsp:include page="../includes/footer.jsp" />
