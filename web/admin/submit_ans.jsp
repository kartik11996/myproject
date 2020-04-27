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
      <h1>Hello World</h1>
     <% 
            int w=1;
            
                Connection cn=new MyLib().connect();
                String quiz_name=request.getParameter("z5");
                String subject=request.getParameter("z1");
                String sql="select * from find_create_question where qusubject=? AND qname=?";
                        PreparedStatement p2=cn.prepareStatement(sql);
                        p2.setString(1,subject);
                        p2.setString(2,quiz_name);
                        ResultSet r1=p2.executeQuery();
                 int p=1;      
                while(r1.next()){

                      String b,c,g,h,i,j,k,l,m,n;
                        i=r1.getString("quid");
                        b=r1.getString("qusubject"); 
                        c=r1.getString("question"); 
                        String user_choice=request.getParameter("a"+w); 
                        k=r1.getString("corrans");
                        m=r1.getString("weight");
                        

                     String ans_id=request.getParameter("z6");
                        if(user_choice!=null){
                        String sql1="Insert into user_ans(ans_id,question_id,dte,quiz_name,user_name,user_ans,corrans,weight,qsubject) values(?,?,?,?,?,?,?,?,?)";
                        PreparedStatement p1=cn.prepareStatement(sql1);

                        p1.setString(1,ans_id);
                        p1.setString(2,i);
                        p1.setLong(3,System.currentTimeMillis());
                        p1.setString(4,quiz_name);
                        p1.setString(5,e1);
                        p1.setString(6,user_choice);
                        p1.setString(7,k);
                        p1.setString(8,m);
                        p1.setString(9, b);
                        int a=p1.executeUpdate();
                        
                        if(a==1){
                             
                     %>
                        <H2>Data Saved</H2>

                     <%
                      }
                      else        
                        { 
                     %>
                            <H2>Error- cannot save data </H2>
                     <%
                        }
                        }
                        w++;
                        }
                     response.sendRedirect("adminhome.jsp");
                     %>

      
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
