<%-- 
    Document   : header
    Created on : 30/04/2024, 10:39:18 PM
    Author     : tekke
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        a{
            text-decoration: none;
            cursor: pointer;
            color: blue;
            font-weight: bold;
        }
        header{
            border-bottom: 5px solid black;
            display: flex;
            justify-content: space-around;
            align-items: center;
        }
        
        footer{
            border-top: 5px solid black;
            display: flex;
            justify-content: center;
            align-items: center;
        }
    </style>
    <body>
        <header>
            <h1>Angel Lecona</h1>
            <a href="vistas/login.jsp">LOGIN</a>
        </header>