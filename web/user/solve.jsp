<%@page import="org.kartik.models.MyLib"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><!-- InstanceBegin template="/Templates/user_home.dwt.jsp" codeOutsideHTMLIsLocked="false" -->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                            
      


      <div class="container-fluid">
       
  <div class="d-flex" id="wrapper">

    <!-- Sidebar -->
    <div class="bg-light border-right" id="sidebar-wrapper">
      <div class="sidebar-heading">PREPARE QUIZ </div>
      <div class="list-group list-group-flush">
        <a href="ask.jsp" class="list-group-item list-group-item-action bg-light">Your Doubts</a>
        <a href="showquestion.jsp" class="list-group-item list-group-item-action bg-light">Add Your Answer</a>
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
                <a class="dropdown-item" href="changepassword.jsp">Change Password</a>
                <a class="dropdown-item" href="../logout.jsp">Log Out</a>
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
            String m=request.getParameter("p");
            Connection cn=new MyLib().connect();
        String sql="select * from qbank where qid="+m;
        PreparedStatement p1=cn.prepareStatement(sql);
        ResultSet r1=p1.executeQuery();
               
        if(r1.next()){
            String a,b,c,d,e;
            a=r1.getString("qid");
            b=r1.getString("qsubject"); 
            c=r1.getString("question"); 
            d=r1.getString("qdate");
            e=r1.getString("qby");
            String name=new MyLib().getName(e);

            %>
            <h3><%= m %>.<%= c %></h3>
            <form name="form1" method="post" action="solve1.jsp"/>           
                 <p>Solution</p>
                 <textarea name="T1" rows="5" cols="60" ></textarea>
                  <input type="hidden" name="p" value="<%= m %>" />
                  <p><input type="submit" name="p4" id="a4" value="upload"/></p>
    </form>
            <%
        }
        %>
        <h1>Solutions</h1>
        <hr/>
        <%
        String s2="select * from solutions where qid="+m;
        p1=cn.prepareStatement(s2);
        r1=p1.executeQuery();
               
        while(r1.next())
        {
            String a,b,c,d,e;
            a=r1.getString("sid");
            b=r1.getString("solution"); 
            c=r1.getString("soldate"); 
            d=r1.getString("solby");
            String f=new MyLib().getName(d);
            %>
            <h3><%= b %></h3>
            <p>
                Date : <%= c %> 
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                Solved By : <%= f %>
            </p>
          <%
        }
        %>
        

         
        <title>JSP Page</title>
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
