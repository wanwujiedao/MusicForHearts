<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/inc/style-app.jsp" %>
<%@ include file="/WEB-INF/views/inc/taglibs.jsp" %>
<%@ include file="/WEB-INF/views/inc/meta.jsp" %>
<%@ include file="/WEB-INF/views/inc/link.jsp" %>
    
<!DOCTYPE html >
<html lang="en" class="app">
<head>  
  <meta charset="utf-8" />
  <title>Music</title>
</head>
<body class="bg-light dk">
    <section id="content">
    <div class="row m-n">
      <div class="col-sm-4 col-sm-offset-4">
        <div class="text-center m-b-lg">
          <h1 class="h text-white animated fadeInDownBig">404</h1>
        </div>
        <div class="list-group auto m-b-sm m-b-lg">
          <a href="${ctx }/page/home.do" class="list-group-item">
            <i class="fa fa-chevron-right icon-muted"></i>
            <i class="fa fa-fw fa-home icon-muted"></i> 主页
          </a>
          <a href="#" class="list-group-item">
            <i class="fa fa-chevron-right icon-muted"></i>
            <i class="fa fa-fw fa-question icon-muted"></i> 发送信息给我们
          </a>
          
        </div>
      </div>
    </div>
  </section>
  <!-- footer -->
  <footer id="footer">
    <div class="text-center padder clearfix">
      <p>
        <small>版权所有,违者必究<br>&copy; 2015</small>
      </p>
    </div>
  </footer>


</body>
</html>