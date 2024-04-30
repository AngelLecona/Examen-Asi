<%-- 
    Document   : header
    Created on : 19/04/2024, 12:09:00 AM
    Author     : tekke
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link rel="stylesheet" href="../css/style2.css">
        <style>
            *,*{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            :root{
                --header: #030122;
                --a1: #e8d48e;
                --white: #fff;
            }

            .img-index{
                width: 100%;
            }

            a{
                text-decoration: none;
                color: var(--a1);
            }

            header{
                width: 100%;
                height: 80px;
                box-shadow: 1px 0 10px 1px;
                padding: 5px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                background: var(--header);
            }

            header img{
                width: 150px;
                height: 100%;
            }

            header nav{
                width: 150px;
                height: 100%;
                display: flex;
                justify-content: space-around;
                align-items: center;
            }


            /* ********************************FOOTER************************************************ */
            footer{
                margin-top: 100px;
                background: var(--header);
                width: 100%;
                display: grid;
                grid-template-columns: 1fr 2fr;
                color: var(--white);
                margin-top: -3px;
                box-shadow: 0px -10px 10px -3px rgba(255,255,255,0.75);
                -webkit-box-shadow: 0px -10px 10px -3px rgba(255,255,255,0.75);
                -moz-box-shadow: 0px -10px 10px -3px rgba(255,255,255,0.75);
                bottom: 0;
                position: relative;
            }

            footer a{
                color: #ffffff;
            }

            footer section:nth-child(1) img{
                width: 300px;
            }

            footer section .btn-chat{
                margin-bottom: 50px;
                padding: 10px;
                color: var(--white);
                border: 1px solid var(--white);
                border-radius: 40px;
                font-weight: bold;
                cursor: pointer;
                background: var(--header);
                font-size: 20px;
            }

            footer section{
                width: 100%;
                height: 100%;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                gap: 30px;
            }

            footer section article{
                width: 100%;
                display: flex;
                justify-content: space-around;
            }

            footer section article img{
                width: 50px;
                height: 50px;
            }



            /* ********************************FOOTER************************************************ */

            .LogReg{
                width: 100%;
                display: grid;
                grid-template-columns: repeat(2, 1fr);
                padding: 30px;
                gap: 20px;
            }

            .LogReg h2{
                text-align: center;
            }

            form{
                padding: 10px;
                display: grid;
                grid-template-columns: repeat(2, 1fr);
                gap: 10px;
            }

            @media (max-width: 700px) {
                .LogReg{
                    grid-template-columns: 1fr;
                }

                form{
                    grid-template-columns: 1fr;
                }
            }

            @media (max-width: 530px) {
                footer{
                    grid-template-columns: 1fr;
                }
            }

            @media (max-width: 310px) {
                footer section:nth-child(1) img{
                    width: 100%;
                }
            }
        </style>
    </head>
    <body>
        <header>
            <img src="./img/Tekken.png" onerror="this.onerror=null; this.src='../img/Tekken.png';">

            <nav>
                
                <a href="./vistas/login.jsp"><h2>Login</h2></a>
            </nav>
        </header>