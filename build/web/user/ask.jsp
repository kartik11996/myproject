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
        <div class="row">
              <div class="col-md-9">
                <div class="card">
                  <div class="card-header">
                    <strong>ADD  QUESTION</strong> FOR QUIZ BANK</div>
                  <div class="card-body">
                    <form class="form-horizontal" action="ask1.jsp" method="post" />
                      <div class="form-group row">
                        <label class="col-md-3 col-form-label" for="text-input">Subject</label>
                        <div class="col-md-9">
                          <input class="form-control"  id="text-input" type="text" name="T1" placeholder="Enter subject" required>
                          <span class="help-block"></span>
                        </div>
                      </div>
                   <div class="form-group row">
                        <label class="col-md-3 col-form-label" for="textarea-input">Question</label>
                        <div class="col-md-9">
                          <textarea class="form-control" id="textarea-input" name="T2" rows="9" placeholder="Enter your question here ..." required></textarea>
                        </div>
                      </div>     
                    <div class="card-footer">
                    <button class="btn btn-sm btn-success" type="submit">
                      <i class="fa fa-dot-circle-o"></i> Submit</button>
                    <button class="btn btn-sm btn-danger" type="reset">
                      <i class="fa fa-ban"></i> Reset</button>
                  </div>

               </form>

                  </div>
                </div>
              </div>
      </div>
      
         
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
