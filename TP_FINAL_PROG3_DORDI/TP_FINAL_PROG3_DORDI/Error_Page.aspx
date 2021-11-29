<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Error_Page.aspx.cs" Inherits="TP_FINAL_PROG3_DORDI.Error_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link href="Content/Estilos.css" rel="stylesheet" />
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />


    <style>
        .container {
            height: 200px;
            display: flex;
            align-items: center;
            justify-content: center;
            
        }

        .box {
           
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh
        }

        .item {
            margin: 0px auto;
            padding: 5px;
        }

        .item2 {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
        }
    </style>

</head>
<body>

    <form action="/" method="post" runat="server">

        <div class="box">
            <div>

                <div class="item">

                    <asp:Label ID="lbl_Error" Text="¡ERROR!" runat="server"  Font-Bold="true" with="100px" Font-Size="Large" ForeColor="Red" />
                </div>

                <div class="item">
                    <asp:Label ID="lbl_msgError" Text="text" runat="server" Font-Bold="true" ForeColor="Red"/>
                </div>


                <div class="item2">
                    <asp:Button type="submit" class="btn btn-primary" Text="VOLVER A MENU" runat="server" OnClick="Volver_Click" />
                </div>

            </div>

        </div>

    </form>


</body>
</html>
