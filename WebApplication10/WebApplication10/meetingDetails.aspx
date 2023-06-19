<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="meetingDetails.aspx.cs" Inherits="WebApplication10.meetingDetails" %>

<!DOCTYPE html>
<html  >
<head>
  <!-- Site made with Mobirise Website Builder v5.6.8, https://mobirise.com -->
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="generator" content="Mobirise v5.6.8, mobirise.com">
  <meta name="twitter:card" content="summary_large_image"/>
  <meta name="twitter:image:src" content="">
  <meta property="og:image" content="">
  <meta name="twitter:title" content="Meeting Details">
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
  <link rel="shortcut icon" href="styles/HostMeetingDetails/assets/images/whatsapp-image-2022-05-29-at-12.20.01-am-removebg-preview-2.png" type="image/x-icon">
  <meta name="description" content="">
  
  
  <title>Meeting Details</title>
  <link rel="stylesheet" href="styles/HostMeetingDetails/assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="styles/HostMeetingDetails/assets/bootstrap/css/bootstrap-grid.min.css">
  <link rel="stylesheet" href="styles/HostMeetingDetails/assets/bootstrap/css/bootstrap-reboot.min.css">
  <link rel="stylesheet" href="styles/HostMeetingDetails/assets/dropdown/css/style.css">
  <link rel="stylesheet" href="styles/HostMeetingDetails/assets/socicon/css/styles.css">
  <link rel="stylesheet" href="styles/HostMeetingDetails/assets/theme/css/style.css">
   <link rel="preload" as="style" href="styles/HostMeetingDetails/assets/mobirise/css/mbr-additional.css"><link rel="stylesheet" href="styles/HostMeetingDetails/assets/mobirise/css/mbr-additional.css" type="text/css">
  
  
  
  
</head>
<body>
  
  <section data-bs-version="5.1" class="menu menu2 cid-t6JxSS5JGt" once="menu" id="menu2-7">
    
    <nav class="navbar navbar-dropdown navbar-fixed-top navbar-expand-lg">
        <div class="container">
            <div class="navbar-brand">
                <span class="navbar-logo">
                    <a href="https://mobiri.se">
                        <img src="styles/HostMeetingDetails/assets/images/whatsapp-image-2022-05-29-at-12.20.01-am-removebg-preview-2.png" alt="Mobirise Website Builder" style="height: 3.9rem;">
                    </a>
                </span>
                
            </div>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-bs-toggle="collapse" data-target="#navbarSupportedContent" data-bs-target="#navbarSupportedContent" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <div class="hamburger">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
               
                    <ul class="navbar-nav nav-dropdown nav-right" data-app-modern-menu="true"><li class="nav-item">
                    <a class="nav-link link text-white display-4" href="ScheduleMeeting.aspx">Schedule a Meeting</a></li>
                    <li class="nav-item">
                        <a class="nav-link link text-white display-4" href="myMeetings.aspx">My Meetings</a></li>
                    <li class="nav-item">
                        <a class="nav-link link text-white display-4" href="viewEmployee.aspx">View Employees</a></li>
                    <li class="nav-item">
                        <a class="nav-link link text-white display-4" href="viewMeetings.aspx">All Meetings</a></li>
                    <li class="nav-item dropdown">
			<a class="nav-link link dropdown-toggle text-white show display-4" href="#" data-toggle="dropdown-submenu" data-bs-toggle="dropdown" data-bs-auto-close="outside" aria-expanded="true">My Account</a>
			<div class="dropdown-menu show" aria-labelledby="dropdown-703" data-bs-popper="none">
			<a class="dropdown-item text-white display-4" href="resetPassword.aspx">Edit Password</a>
			
			<a class="dropdown-item text-white display-4" href="LogOut.aspx">Log Out</a></div>
                    </li></ul>
            </div>
        </div>
    </nav>
</section>

<section data-bs-version="5.1" class="form4 cid-t7g0hDe3E8 mbr-fullscreen" id="form4-r">

    

    

    <div class="container">
        <div class="row content-wrapper justify-content-center">
            <div class="col-lg-3 offset-lg-1 mbr-form" data-form-type="formoid">
                <form action="https://mobirise.eu/" method="POST" class="mbr-form form-with-styler" data-form-title="Form Name"><input type="hidden" name="email" data-form-email="true" value="7h8x0tioJindW477i6rb/kqVnhnSdc/s46Ok/sHyOPImgDQSdyxzKnYPihrKuxqvuCUE6Fn88CoQNiftY84UF8YbrAZs1hGnpRaJGr05bEFAhC0nILc35OiTIUKI48DZ">
                    <div class="row">
                    </div>
                     <asp:DataList ID="DataList1" runat="server" CssClass="row">  
                <ItemTemplate>  
                    <div class="dragArea row">
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <h1 class="mbr-section-title mb-4 display-2"><strong>Title:&nbsp; <%#Eval("meetingTitle")%></strong></h1>
                        </div>
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <p class="mbr-text mbr-fonts-style mb-4 display-7">Department:&nbsp; <%#Eval("deptName")%></p>
                            <p class="mbr-text mbr-fonts-style mb-4 display-7">Host:&nbsp; <%#Eval("hostemail")%> </p>
                            <p class="mbr-text mbr-fonts-style mb-4 display-7">Description:&nbsp;  <%#Eval("description_")%>  </p>
                             <p class="mbr-text mbr-fonts-style mb-4 display-7">Date and Time:&nbsp;  <%#Eval("Date_")%>  </p>
                            <p class="mbr-text mbr-fonts-style mb-4 display-7">Duration:&nbsp;  <%#Eval("duration")%>  </p>
                             <p class="mbr-text mbr-fonts-style mb-4 display-7">Mode:&nbsp;  <%#Eval("mode")%>  </p>
                            <p class="mbr-text mbr-fonts-style mb-4 display-7">Venue:&nbsp;  <%#Eval("venueName")%>  </p>
                            <p class="mbr-text mbr-fonts-style mb-4 display-7">Note:&nbsp;  <%#Eval("Note")%>  </p>
                        </div>
                        
                    </div>
                       </ItemTemplate>        
         </asp:DataList>
                </form>
            </div>
            <div class="col-lg-7 offset-lg-1 col-12">
                <div class="image-wrapper">
                    <img class="w-100" src="styles/HostMeetingDetails/assets/images/mbr-1-1476x1476.png" alt="Mobirise Website Builder">
                </div>
            </div>
        </div>
    </div>
</section>

<section data-bs-version="5.1" class="content9 cid-t7gDakDt92" id="content9-z">
    

    <div class="container">
        <div class="row justify-content-center">
            <div class="counter-container col-md-12 col-lg-10">
                <h4 class="mbr-section-title mbr-fonts-style mb-4 display-2">Participants</h4>
                <ol type="1"> 
                <asp:DataList ID="DataList3" runat="server" CssClass="row">  
                <ItemTemplate>  
                <div class="mbr-text mbr-fonts-style display-7">
                    
                        <li><strong><%#Eval("participantemail")%> </strong></li>
                </div>
                      </ItemTemplate>        
         </asp:DataList>
                     </ol>
                 <div class="row justify-content-center">
                
                </div>
            </div>
        </div>
    </div>
</section>

<section data-bs-version="5.1" class="footer3 cid-t79ReqaUkr" once="footers" id="footer3-d">

    

    

    <div class="container">
        <div class="media-container-row align-center mbr-white">
            <div class="row row-links">
                <ul class="foot-menu">
                    
                    
                    
                    
                    
                <li class="foot-menu-item mbr-fonts-style display-7">
                        <a class="text-white" href="#" target="_blank">About us</a>
                    </li><li class="foot-menu-item mbr-fonts-style display-7">
                        <a class="text-white" href="#" target="_blank">Services</a>
                    </li><li class="foot-menu-item mbr-fonts-style display-7">
                        <a class="text-white" href="#" target="_blank">Contact Us</a>
                    </li><li class="foot-menu-item mbr-fonts-style display-7">
                        <a class="text-white" href="#" target="_blank">Careers</a>
                    </li><li class="foot-menu-item mbr-fonts-style display-7">
                        <a class="text-white" href="#" target="_blank">Work</a>
                    </li></ul>
            </div>
            <div class="row social-row">
                <div class="social-list align-right pb-2">
                    
                    
                    
                    
                    
                    
                <div class="soc-item">
                        <a href="https://twitter.com/mobirise" target="_blank">
                            <span class="socicon-twitter socicon mbr-iconfont mbr-iconfont-social"></span>
                        </a>
                    </div><div class="soc-item">
                        <a href="https://www.facebook.com/pages/Mobirise/1616226671953247" target="_blank">
                            <span class="socicon-facebook socicon mbr-iconfont mbr-iconfont-social"></span>
                        </a>
                    </div><div class="soc-item">
                        <a href="https://www.youtube.com/c/mobirise" target="_blank">
                            <span class="socicon-youtube socicon mbr-iconfont mbr-iconfont-social"></span>
                        </a>
                    </div><div class="soc-item">
                        <a href="https://instagram.com/mobirise" target="_blank">
                            <span class="socicon-instagram socicon mbr-iconfont mbr-iconfont-social"></span>
                        </a>
                    </div><div class="soc-item">
                        <a href="https://plus.google.com/u/0/+Mobirise" target="_blank">
                            <span class="socicon-googleplus socicon mbr-iconfont mbr-iconfont-social"></span>
                        </a>
                    </div><div class="soc-item">
                        <a href="https://www.behance.net/Mobirise" target="_blank">
                            <span class="socicon-behance socicon mbr-iconfont mbr-iconfont-social"></span>
                        </a>
                    </div></div>
            </div>
            <div class="row row-copirayt">
                <p class="mbr-text mb-0 mbr-fonts-style mbr-white align-center display-7">
                    © Copyright 2025 Multitude. All Rights Reserved.
                </p>
            </div>
        </div>
    </div>
</section><section class="display-7" style="padding: 0;align-items: center;justify-content: center;flex-wrap: wrap;    align-content: center;display: flex;position: relative;height: 4rem;"><a href="https://mobiri.se/2784513" style="flex: 1 1;height: 4rem;position: absolute;width: 100%;z-index: 1;"><img alt="" style="height: 4rem;" src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw=="></a><p style="margin: 0;text-align: center;" class="display-7">Designed with Mobirise &#8204;</p><a style="z-index:1" href="https://mobirise.com/offline-website-builder.html">Offline Web Page Maker</a></section><script src="styles/HostMeetingDetails/assets/bootstrap/js/bootstrap.bundle.min.js"></script>  <script src="styles/HostMeetingDetails/assets/smoothscroll/smooth-scroll.js"></script>  <script src="styles/HostMeetingDetails/assets/ytplayer/index.js"></script>  <script src="styles/HostMeetingDetails/assets/dropdown/js/navbar-dropdown.js"></script>  <script src="styles/HostMeetingDetails/assets/theme/js/script.js"></script>  <script src="styles/HostMeetingDetails/assets/formoid/formoid.min.js"></script>  
  
  
</body>
</html>