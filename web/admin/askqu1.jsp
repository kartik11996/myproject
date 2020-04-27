<%@page import="org.kartik.models.MyLib"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><!-- InstanceBegin template="/Templates/adminhome1.dwt.jsp" codeOutsideHTMLIsLocked="false" -->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- InstanceBeginEditable name="doctitle" -->
        <title>JSP Page</title>
        <!-- InstanceEndEditable -->
        <link href="../Bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/simple-sidebar.css" rel="stylesheet" type="text/css"/>
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
                    if(ut.equalsIgnoreCase("admin")==false)
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
                            
      


      <div class="container-fluid">
       
  <div class="d-flex" id="wrapper">

    <!-- Sidebar -->
    <div class="bg-light border-right" id="sidebar-wrapper">
      <div class="sidebar-heading">PREPARE QUIZ </div>
      <div class="list-group list-group-flush">
        <a href="askqu.jsp" class="list-group-item list-group-item-action bg-light">Add Question</a>
        <a href="taksub.jsp" class="list-group-item list-group-item-action bg-light">Create Quiz</a>
        <a href="Showquiz.jsp" class="list-group-item list-group-item-action bg-light">Show Quiz</a>
        <a href="quizbank.jsp" class="list-group-item list-group-item-action bg-light">Quiz Bank</a>
        <a href="profile.jsp" class="list-group-item list-group-item-action bg-light">Profile</a>
        <a href="ShowStudents.jsp" class="list-group-item list-group-item-action bg-light">Status</a>
         <a href="Subject_result.jsp" class="list-group-item list-group-item-action bg-light">Result</a>
      </div>
    </div>
    <!-- /#sidebar-wrapper -->

    <!-- Page Content -->
    <div id="page-content-wrapper">

      <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
        <button class="btn btn-primary" id="menu-toggle">Toggle Menu</button>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav ml-auto mt-2 mt-lg-0">
            <li class="nav-item active">
              <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Link</a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Dropdown
              </a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="../user/changepassword.jsp">Chnage Password</a>
                <a class="dropdown-item" href="../logout.jsp">Logout</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#">Something else here</a>
              </div>
            </li>
          </ul>
        </div>
      </nav>

      <div class="container-fluid">
              <h1 class="mt-4"></h1>
      <!-- InstanceBeginEditable name="head" -->
        <% 
            
            Connection cn=new MyLib().connect();
             
            String subject=request.getParameter("T1");
            String question=request.getParameter("T2");
            String optionA=request.getParameter("a");
            String optionB=request.getParameter("b");
            String optionC=request.getParameter("c");
            String optionD=request.getParameter("d");
            String correctAns=request.getParameter("e");
            String Weightage=request.getParameter("f");
            String topic=request.getParameter("T3");
            String sql="Insert into quizbank(qusubject,question,qudate,quby,option1,option2,option3,option4,corrans,weight,topic) values(?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement p1=cn.prepareStatement(sql);
            
            p1.setString(1,subject);
            p1.setString(2,question);
            p1.setLong(3,System.currentTimeMillis());
            p1.setString(4,e1);
            p1.setString(5,optionA);
            p1.setString(6,optionB);
            p1.setString(7,optionC);
            p1.setString(8,optionD);
            p1.setString(9,correctAns);
            p1.setString(10,Weightage);
            p1.setString(11,topic);
            int a=p1.executeUpdate();
            if(a==1){
                 response.sendRedirect("askqu.jsp");
         %>
            <H2>Data Saved</H2>

         <%
          }
          else        
            {  response.sendRedirect("../error404.jsp");
         %>
                <H2>Error- cannot save data </H2>
         <%
            }%>

      
      
      <!-- InstanceEndEditable -->

      </div>
    </div>
    <!-- /#page-content-wrapper -->

  </div>
  <script src="../jquery/jquery.min.js" type="text/javascript"></script>
  <script src="../js/bootstrap.bundle.min.js" type="text/javascript"></script>
  <!-- Menu Toggle Script -->
  <script>
    $("#menu-toggle").click(function(e) {
      e.preventDefault();
      $("#wrapper").toggleClass("toggled");
    });
  </script>

  
    </body>
<!-- InstanceEnd --></html>
