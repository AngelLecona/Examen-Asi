<%-- 
    Document   : login
    Created on : 19/04/2024, 01:05:03 AM
    Author     : tekke
--%>


<jsp:include page="../includes/header.jsp" />
<style>
    .LogReg1{
        width: 100%;

    }
    .log1{
        width: 100%;
        height: 50vh;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        gap: 50px;
    }
</style>

<div class="LogReg1">
    <section class="log1">
        <h2>Login</h2>
        <form action="LoginUser.jsp" method="get">
            <label for="user">USERNAME:</label>
            <input type="text" id="user" name="username" required>

            <label for="pass">PASSWORD:</label>
            <input type="password" id="pass" name="password" required>

            <input type="submit" value="Ingresar">
        </form>

    </section>


</div>

<jsp:include page="../includes/footer.jsp" />

