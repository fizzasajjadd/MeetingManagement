<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="WebApplication10.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

	<link rel="stylesheet" href="styles/style1.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

 </head>
    <body>
	<section class="login">
		<div class="login_box">
			<div class="left">
				<div class="top_link"><a  href="homepage.aspx"><img src="https://drive.google.com/u/0/uc?id=16U__U5dJdaTfNGobB_OpwAJ73vM50rPV&export=download" alt="">Return home</a></div>
				<div class="contact">
					<form id="form1" runat="server">
						<h3>SIGN UP</h3>
						<asp:TextBox ID="name" placeholder="Full Name" runat="server" required="" Height="32px"></asp:TextBox>
						<asp:TextBox ID="email" placeholder="Email" runat="server" required="" Height="32px" Width="198px"></asp:TextBox>
						<asp:TextBox ID="CNIC" placeholder="CNIC" runat="server" required=""></asp:TextBox>
						<asp:TextBox ID="Phone" placeholder="Phone Number" runat="server" required="" Height="33px"></asp:TextBox>
						<asp:TextBox ID="password_" placeholder="Password" runat="server" TextMode="Password" MaxLength="8" required="" Height="30px" Width="184px"></asp:TextBox>
						<asp:TextBox ID="newpass" placeholder="Confirm Password" runat="server" TextMode="Password" MaxLength="8" required="" Height="30px" Width="270px"></asp:TextBox>

					
						<Label>Department:</Label>
						<br/>
			  
						<asp:RadioButton ID="RadioButton3" runat="server" Text="Social Media" />
						<br/>
						
						<asp:RadioButton ID="RadioButton4" runat="server" Text="Marketing" />
						<br/>

						<asp:RadioButton ID="RadioButton5" runat="server" Text="Sales" />
					<br/>
						<Label>Sign up as:</Label>
			  
						<asp:RadioButton ID="RadioButton1" runat="server" Text="Employee" />
						
						<asp:RadioButton ID="RadioButton2" runat="server" Text="Host" />


						<asp:Button  ID="Button2" runat="server" BackColor ="#04619f" class="submit" Text="Sign Up" Height="33px" Width="192px" onClick="SignUp_Click"/>
						
					</form>
				</div>
			</div>
			<div class="right">
				<div class="right-text">
					<h2>MULTITUDE</h2>
					<h5>Sign up to Continue!</h5>
				</div>
				<div class="right-inductor"><img src="https://lh3.googleusercontent.com/fife/ABSRlIoGiXn2r0SBm7bjFHea6iCUOyY0N2SrvhNUT-orJfyGNRSMO2vfqar3R-xs5Z4xbeqYwrEMq2FXKGXm-l_H6QAlwCBk9uceKBfG-FjacfftM0WM_aoUC_oxRSXXYspQE3tCMHGvMBlb2K1NAdU6qWv3VAQAPdCo8VwTgdnyWv08CmeZ8hX_6Ty8FzetXYKnfXb0CTEFQOVF4p3R58LksVUd73FU6564OsrJt918LPEwqIPAPQ4dMgiH73sgLXnDndUDCdLSDHMSirr4uUaqbiWQq-X1SNdkh-3jzjhW4keeNt1TgQHSrzW3maYO3ryueQzYoMEhts8MP8HH5gs2NkCar9cr_guunglU7Zqaede4cLFhsCZWBLVHY4cKHgk8SzfH_0Rn3St2AQen9MaiT38L5QXsaq6zFMuGiT8M2Md50eS0JdRTdlWLJApbgAUqI3zltUXce-MaCrDtp_UiI6x3IR4fEZiCo0XDyoAesFjXZg9cIuSsLTiKkSAGzzledJU3crgSHjAIycQN2PH2_dBIa3ibAJLphqq6zLh0qiQn_dHh83ru2y7MgxRU85ithgjdIk3PgplREbW9_PLv5j9juYc1WXFNW9ML80UlTaC9D2rP3i80zESJJY56faKsA5GVCIFiUtc3EewSM_C0bkJSMiobIWiXFz7pMcadgZlweUdjBcjvaepHBe8wou0ZtDM9TKom0hs_nx_AKy0dnXGNWI1qftTjAg=w1920-h979-ft" alt=""></div>
			</div>
		</div>
	</section>
</body>
</html>