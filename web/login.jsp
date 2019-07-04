<%@page contentType="text/html" pageEncoding="UTF-8"%><!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function A(){
                if(require(f.t1,"Enter your email"))==false{
                    f.t1.focus();
                    return false;
                }
                else if(require(f.t2,"Enter your password")==false{
                    f.t2.focus();
                    return false;
                }
            }
            function require(ele,msg)
            {
                if(ele.value==null || ele.value==""){
                    alert(msg);
                    return false;
                 }
                 else{
                     return true;
                 }
            }
        </script>
    </head>
    <body>
        <form method="post" action="checklogin.jsp">
            <p>Email</p><input type="email" name="T1" id="t1"/>
            <p>Password</p><input type="password" name="T2"  id="t2" />
            <p><input type="submit" name="submit" value="login" onclick="A()" /></p>
        </form>
    </body>
</html>
