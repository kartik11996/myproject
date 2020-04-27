
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/userhome.css" rel="stylesheet" type="text/css"/>
        <link href="../Bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
        <link href="../Bootstrap/js/bootstrap.js" rel="stylesheet" type="text/javascript">
        <title>JSP Page</title>
        <%
            String e1="",ut="";
            session=request.getSession(false);
            if(session==null)
            {
                response.sendRedirect("../auth_error.jsp");
            }
            else
            {
                try
                {
                    e1=session.getAttribute("email").toString();
                    ut=session.getAttribute("usertype").toString();
                    if(ut.equalsIgnoreCase("user")==false)
                    {
                        response.sendRedirect("../auth_error.jsp");
                    }
                }
                catch(NullPointerException e)
                {
                    response.sendRedirect("../auth_error.jsp");
                }
            }
        %>
     
    </head>
    <body>
        
      	<div id="main">
        	<div id="wrapper">
        	<div id="header">
            	<div id="logo">
               		<img src="220px-M.B.M._Engineering_College_-_Logo.png" height="70" width="70"></div>
              	   <div id="title">
                 		<a href="about.html"><p>Education for you</p></a>						        
                   </div>
                   <form method="post" action="../logout.jsp">
                        <span><input type="submit" name="a1" value="logout"/></span>
                   </form>

                      
          	 </div>
             <div >   
            	 <ul>
                   	<li><a href="my1.html"><p>Home</p></a></li>
                    <li><a href="ask.jsp"><p>About</p></a></li>
                    <li><a href="profile.jsp"><p>Profile</p></a></li>
                    <li class="dropdown">
                    <a href="quizpage.jsp" class="dropbtn"><p>Take quizzes</p></a>
                    	<div class="dropdown-content">
                            <a href="#"><p>Data structure</p></a>
                            <a href="#"><p>Computer org</p></a>
                            <a href="#"><p>C</p></a>
                            <a href="#"><p>Python</p></a>
                        </div>
                    </li>
                    <li><a href="showquestion.jsp"><p>Solve Question</p></a></li>
                    <li><a href="ask.jsp"><p>Doubts</p></a></li>
                </ul>
            </div>
            <div id="slidshow">
 				           
            </div>
            <div id="middle">
            	<div id="c1">
                	
                </div>
                <div id="c2"></div>
            </div>
            <div id="footer">
            	Copyright&copy;<span>By kartik</span>
            </div>        
        </div>
     </div>       

    </body>
</html>
