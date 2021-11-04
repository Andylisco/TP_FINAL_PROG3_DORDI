<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TP_FINAL_PROG3_DORDI.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>LOGIN</title>

     <asp:PlaceHolder runat="server">
        <%: Scripts.Render("~/bundles/modernizr") %>
    </asp:PlaceHolder>

    <webopt:bundlereference runat="server" path="~/Content/css" />
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />


    <style>
        .container {
        height: 200px;
        display: flex;        
        align-items: center;
        justify-content: center;
        background-color:cornflowerblue;
        background-size:cover;
        }
        .box {
         background:linear-gradient(105deg, rgba(255,255,255,.2) 39%, rgba(51,56,57,1) 96%) center center / 400px 200px no-repeat,
             url(big-star.png) center no-repeat, rebeccapurple;
         display: flex;        
         align-items: center;
         justify-content: center;
         height: 100vh
         
        }
        
        .item {
             margin:0px auto;
             padding: 5px;
        }
        .item2 {
            display:flex;
            justify-content: center;
            align-items: center;
            width:100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" >
        <div  class="box" >  
            <div >
            
                <div class="item">
                    <div>
                        <asp:Label runat="server" for="txt_Usuario" class="form-label" Font-Bold="true" Text="Usuario"/>
                    </div>
                    <asp:TextBox runat="server" class="form-control" ID="txt_Usuario"/>
                </div>

                <div class="item">
                    <div>
                        <asp:Label for="txt_Contraseña" runat="server" class="form-label" Font-Bold="true" Text="Contraseña"/>
                    </div>
                    <asp:TextBox runat="server" class="form-control" ID="txt_Contraseña" Type="Password"/>
                <div>
                    <asp:Label id="Msg_ErrorLogin"  Text="Usuario o contraseña incorrecto." runat="server" class="form-text" style="color:orangered"/>
                </div>
                </div>
                
                
                    <div class="item2">
                        <asp:Button type="submit" class="btn btn-primary" Text="Loguear" runat="server"  OnClick="Login_Click"  />
                    </div>
                
            </div>

        </div>
    </form>
</body>
</html>
