<%@page import="java.sql.*"%>
<%@page import="org.kartik.models.MyLib"%>
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
         <h1>Questions</h1>
        <form method="post" action="submit_ans.jsp">
            
        <%
            
            String p=request.getParameter("t1");
            String q=request.getParameter("t2");
        Connection cn=new MyLib().connect();
        String sql="select * from find_create_question where qusubject=? AND qname=?";
        PreparedStatement p1=cn.prepareStatement(sql);
        p1.setString(1,q);
        p1.setString(2,p);
        ResultSet r1=p1.executeQuery();
       
        %>
        <h4><%= p %></h4>
        <h6><%= q %><span>   </span></h6>
        <%
        int w=1,x=1;
        while(r1.next()){
            String a,b,c,g,h,i,j,k,l,m,n;
            a=r1.getString("quid");
            b=r1.getString("qusubject"); 
            c=r1.getString("question"); 
            String d=r1.getString("dt"); 
            g=r1.getString("option1");
            h=r1.getString("option2");
            i=r1.getString("option3");
            j=r1.getString("option4");
            k=r1.getString("corrans");
            m=r1.getString("weight");
            
        %>            
      Date <%= d %>
          <h5> <%= x %>.<%= c %></h5>
            <input type="hidden" name="z2" value="<%= a %>"/>
            <input type="hidden" name="z3" value="<%= k %>"/>
            <input type="hidden" name="z4" value="<%= m %>"/>
            <input type="hidden" name="z5" value="<%= p %>"/>
             <input type="hidden" name="z6" value="<%= x %>"/>
             <input type="hidden" name="z1" value="<%= b %>"
            <p><input type="radio" name="a<%= w %>" value="1"/> <%= g %></p>
            <p><input type="radio" name="a<%= w %>" value="2" /> <%= h %></p>
            <p><input type="radio" name="a<%= w %>" value="3"/> <%= i %></p>
            <p><input type="radio" name="a<%= w %>" value="4"/> <%= j %></p>
 <%
         x++;
         w++;
        }
        %>
                  <div class="card-footer">
                    <button class="btn btn-sm btn-success" type="submit">
                      <i class="fa fa-dot-circle-o"></i> Submit</button>
                    <button class="btn btn-sm btn-danger" type="reset">
                      <i class="fa fa-ban"></i> Reset</button>
                  </div>
        </form>

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
