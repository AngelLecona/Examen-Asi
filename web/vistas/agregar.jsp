<%@ page import="java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../includes/header.jsp" />

<style>
    body{
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }
    
    form{
        width: 500px;
        margin: 50px 0;
    }
    
    h1{
        margin-top: 30px;
    }
    
    .add{
        grid-column: 1 / 3;
        font-size: 18px;
        font-weight: bold;
        background-color: transparent;
    }
    
    .add:hover{
        font-size: 20px;
    }
</style>

<h1>Agregar USUARIOS</h1>
<form action="add.jsp" method="POST">
    <label>Nombre: </label>
    <input type="text" name="nombre">
    
    <label>Password </label>
    <input type="password" name="pass">
    <input class="add" type="submit" value="Agregar">
</form>
<jsp:include page="../includes/footer.jsp" />
