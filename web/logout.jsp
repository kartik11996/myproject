<%
    session=request.getSession(false); //open only existing session
    if(session==null)
    {
        response.sendRedirect("login.jsp");
    }
    else
    {
        try
        {
            session.removeAttribute("email");
            session.removeAttribute("usertype");
            session.invalidate(); //remove complete session
            response.sendRedirect("login.jsp");
        }
        catch(NullPointerException e)
        {
            response.sendRedirect("login.jsp");
        }
    }
%>