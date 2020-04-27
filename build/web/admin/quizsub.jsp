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
      <div class="row">
              <div class="col-md-12">
                <div class="card">
                  <div class="card-header">
                    <strong>ALL QUESTIONS QUIZ BANK</strong></div>
                  <div class="card-body">
                    <form class="form-horizontal" action="quizselect.jsp" method="post" />
                     <div class="form-group row">
                        <label class="col-md-2 col-form-label" for="text-input">Quiz Name</label>
                        <div class="col-md-6">
                          <input class="form-control" id="text-input" type="text" name="T1" placeholder="Enter Quiz Name">
                          <span class="help-block"></span>
                        </div>
                      </div>
         
      <%
        Connection cn=new MyLib().connect();
        String x=request.getParameter("t1");
        String sql="select * from quizbank where qusubject=?";
        PreparedStatement p1=cn.prepareStatement(sql);
        p1.setString(1,x);
        ResultSet r1=p1.executeQuery();
         int p=1;      
        while(r1.next()){
            String a,b,c,d,e,g,h,i,j,k,l,m,n;
            a=r1.getString("quid");
            b=r1.getString("qusubject"); 
            c=r1.getString("question"); 
            d=r1.getString("qudate");
            e=r1.getString("quby");
            
            g=r1.getString("option1");
            h=r1.getString("option2");
            i=r1.getString("option3");
            j=r1.getString("option4");
            k=r1.getString("corrans");
            m=r1.getString("weight");
            String f=new MyLib().getName1(e);
        %>
 
          <p><%= b%><span>   Date <%= d %></span>
            <span>Created By: <%= f %></span></p>            
           
          <h4><input type="checkbox" name="C<%= p %>" value="<%= a %>" /><div class="well well-sm"> <%= a %>.<%= c %></div></h4>
        
            <p><input type="radio" name="a" /> <%= g %></p>
            <p><input type="radio" name="a" /> <%= h %></p>
            <p><input type="radio" name="a" /> <%= i %></p>
            <p><input type="radio" name="a" /> <%= j %></p>
                
        
  
 <% 
 p++;
        }
        %>
 
                  <div class="card-footer">
                    <button class="btn btn-sm btn-success" type="submit">
                      <i class="fa fa-dot-circle-o"></i> Create Quiz</button>
                    <button class="btn btn-sm btn-danger" type="reset">
                      <i class="fa fa-ban"></i> Reset</button>
                  </div>
        </form>
                  </div>
                </div>
              </div>
      </div>
      </div>
      
      
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
