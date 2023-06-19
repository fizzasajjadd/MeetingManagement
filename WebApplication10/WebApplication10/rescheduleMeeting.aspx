<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rescheduleMeeting.aspx.cs" Inherits="WebApplication10.rescheduleMeeting" %>




<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   
    
     
   
  <!-- Site made with Mobirise Website Builder v5.6.8, https://mobirise.com -->
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="generator" content="Mobirise v5.6.8, mobirise.com">
  <meta name="twitter:card" content="summary_large_image"/>
  <meta name="twitter:image:src" content="">
  <meta property="og:image" content="">
  <meta name="twitter:title" content="Home">
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
  <link rel="shortcut icon" href="styles/scheduleMeeting/assets/images/photo-2022-04-05-22-33-55-removebg-preview-1.png" type="image/x-icon">
  <meta name="description" content="">
  
  
  <title>Home</title>
  <link rel="stylesheet" href="styles/scheduleMeeting/assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="styles/scheduleMeeting/assets/bootstrap/css/bootstrap-grid.min.css">
  <link rel="stylesheet" href="styles/scheduleMeeting/assets/bootstrap/css/bootstrap-reboot.min.css">
  <link rel="stylesheet" href="styles/scheduleMeeting/assets/dropdown/css/style.css">
  <link rel="stylesheet" href="styles/scheduleMeeting/assets/socicon/css/styles.css">
  <link rel="stylesheet" href="styles/scheduleMeeting/assets/theme/css/style.css">
  <link rel="preload" as="style" href="styles/scheduleMeeting/assets/mobirise/css/mbr-additional.css"><link rel="stylesheet" href="styles/scheduleMeeting/assets/mobirise/css/mbr-additional.css" type="text/css">
  
  
  
  
</head>
<body>
  
  <section data-bs-version="5.1" class="menu menu2 cid-t6JxSS5JGt" once="menu" id="menu2-7">
    
    <nav class="navbar navbar-dropdown navbar-fixed-top navbar-expand-lg">
        <div class="container">
            <div class="navbar-brand">
                <span class="navbar-logo">
                    <a href="https://mobiri.se">
                        <img src="styles/scheduleMeeting/assets/images/photo-2022-04-05-22-33-55-removebg-preview-1.png" alt="Mobirise Website Builder" style="height: 3rem;">
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

<section data-bs-version="5.1" class="form7 cid-t6JJC1Lk2N" id="form7-8">
    
    
    <div class="container">
        <div class="mbr-section-head">
            <h3 class="mbr-section-title mbr-fonts-style align-center mb-0 display-2"><strong>Reschedule a Meeting</strong></h3>
            
        </div>
        <div class="row justify-content-center mt-4">
            <div class="col-lg-8 mx-auto mbr-form" data-form-type="formoid">

                    <p class="mbr-text mbr-fonts-style align-center mb-4 display-7">Enter the Details!</p>
                    
                    <form action="#" runat="server">
                    
                        <div data-for="phone" class="col-lg-12 col-md-12 col-sm-12 form-group mb-3">
                              <label>Meeting Date and Time: </label>
                            <asp:TextBox type="text" id="datetime" name="date" placeholder="DATE" TextMode="DateTimeLocal"  data-form-field="name" class="form-control" value=""  runat="server"/>
                        </div>
			            
                    
                      
                        <br/><br/>

                        <div class="col-auto mbr-section-btn align-center">
                             <br/><br/>
                            <asp:Button type="reschedule" class="btn btn-success display-4" Text="Reschedule" runat="server" onClick="Unnamed_Click"/>

                        </div>
                   
                </form>
            </div>
        </div>
    </div>
</section>

<section data-bs-version="5.1" class="footer3 cid-t6JaYKmGKX" once="footers" id="footer3-3">

    

    

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
                    © Copyright 2025 Mobirise. All Rights Reserved.
                </p>
            </div>
        </div>
    </div>
</section><section class="display-7" style="padding: 0;align-items: center;justify-content: center;flex-wrap: wrap;    align-content: center;display: flex;position: relative;height: 4rem;"><a href="https://mobiri.se/" style="flex: 1 1;height: 4rem;position: absolute;width: 100%;z-index: 1;"><img alt="" style="height: 4rem;" src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw=="></a><p style="margin: 0;text-align: center;" class="display-7">Built with &#8204;</p><a style="z-index:1" href="https://mobirise.com">Mobirise </a></section><script src="styles/scheduleMeeting/assets/bootstrap/js/bootstrap.bundle.min.js"></script>  <script src="styles/scheduleMeeting/assets/smoothscroll/smooth-scroll.js"></script>  <script src="styles/scheduleMeeting/assets/ytplayer/index.js"></script>  <script src="styles/scheduleMeeting/assets/dropdown/js/navbar-dropdown.js"></script>  <script src="styles/scheduleMeeting/assets/theme/js/script.js"></script>  <script src="styles/scheduleMeeting/assets/formoid/formoid.min.js"></script>  
  
  
</body>
</html>