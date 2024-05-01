<%-- 
    Document   : login
    Created on : 19/04/2024, 01:05:03 AM
    Author     : tekke
--%>


<jsp:include page="../includes/header.jsp" />
<style>
    div{
        height: 400px;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
    }
</style>

<div>

        <h2>IICIAR SESION</h2>
        <form action="validar.jsp" method="get">
            <label for="user">USUARIO</label>
            <input type="text" id="user" name="usuario" required>

            <label for="pass">Contraseña</label>
            <input type="password" id="pass" name="contrasena" required>

            <input type="submit" value="Ingresar">
        </form>



</div>

<jsp:include page="../includes/footer.jsp" />

