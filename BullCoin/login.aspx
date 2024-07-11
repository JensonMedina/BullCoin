<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="BullCoin.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link
        rel="shortcut icon"
        href="img/bullCoinIcono.jpg"
        type="image/x-icon" />
    <title>Registro BullCoin</title>
    <link rel="stylesheet" href="css/pages/register.css">
</head>
<body>
    <form id="form1" runat="server">
    <div class="navbar">
        <img src="img/bullCoinIcono.jpg" alt="Logo BullCoin" class="logo">
        <asp:Button ID="btnClose" CssClass="close-btn" runat="server" Text="x" OnClick="btnClose_Click" />
    </div>
    <div class="container">

        <h2>Te damos la bienvenida de nuevo.</h2>
        <p>¿Por primera vez en BullCoin? <a href="register.aspx">Regístrate</a></p>
        <div class="form">
            <label for="email">Correo Electrónico:</label>
            <asp:TextBox ID="email" TextMode="Email" runat="server"></asp:TextBox>
            <label for="password">Contraseña:</label>
            <asp:TextBox ID="password" TextMode="Password" runat="server"></asp:TextBox>
            <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
            <asp:Button ID="btnEnviar" CssClass="register-btn" runat="server" Text="Iniciar sesión" OnClick="btnEnviar_Click" />
        </div>
    </div>
</form>
</body>
</html>
