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
              <div class="container-fluid">
          <div class="animated fadeIn">
            <div class="row">
              <div class="col-lg-8">
                <div class="card">
                  <div class="card-header">
                    <i class="fa fa-align-justify"></i>Result Table</div>
                  <div class="card-body">
                    <table class="table table-responsive-sm">
                      <thead>
       
     
          <tr>
              <th>Question</th><th>Marks</th></tr>
          <tr>
        <%
            int q1=0,q2=1;
            String x=request.getParameter("t1");
            String y=request.getParameter("t2");
        Connection cn=new MyLib().connect();
        String sql="select * from user_ans where quiz_name=? AND qsubject=? AND user_name=?";
        PreparedStatement p1=cn.prepareStatement(sql);
        p1.setString(1,x);
        p1.setString(2,y);
        p1.setString(3,e1);
        ResultSet r1=p1.executeQuery();
       double s1=0,s2=0;
       
        while(r1.next()){
            String a,b,c,d,e,g,h,i,j,k,l,m,n;
            a=r1.getString("question_id");
            d=r1.getString("dte");
            e=r1.getString("user_name");
            
            g=r1.getString("quiz_name");
            j=r1.getString("user_ans");
            k=r1.getString("corrans");
            m=r1.getString("weight");
            int q=Integer.parseInt(m);
            String f=new MyLib().getName1(e);
        
            %> <th><%= q2 %></th>
       <%     
        if(j.equals(k)){
            s1+=q;
            %>
          <td> <%= q %> </td>
            <% 
           
        }
        else{
            %>
            <td><%= q1 %></td>
            <%
        }
        
        s2+=q;
        
        q2++;
        %>
        
          </tr>
       <%
        }
         double answer=(s1/s2)*100;
              // out.println(s2);
        %>
        <tr><th>You got:</th><td><%= s1 %></td></tr>
        <tr><th>Total Number :</th><td><%= s2 %></td></tr>
        <tr><th>Your result is(%):</th><td><%= answer %></td></tr>

     
      </table>
                  </div>
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
