<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="BullCoin.Register" %>

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
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="navbar">
            <img src="img/bullCoinIcono.jpg" alt="Logo BullCoin" class="logo">
            <button class="close-btn" onclick="window.location.href='default.aspx'">x</button>
        </div>
        <div class="container">

            <h2>Crea tu cuenta BullCoin</h2>
            <p>¿Ya tienes una cuenta? <a href="login.aspx">Inicia sesión</a></p>
            <div class="form">
                <label for="email">Correo Electrónico:</label>
                <asp:TextBox ID="email" TextMode="Email" runat="server"></asp:TextBox>
                <label for="password">Contraseña:</label>
                <asp:TextBox ID="password" TextMode="Password" runat="server"></asp:TextBox>
                <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                <asp:Button ID="btnRegistrar" CssClass="register-btn" runat="server" Text="Registrar" OnClick="btnRegistrar_Click" />
            </div>
        </div>
        <script src="js/pages/register.js"></script>
    </form>
</body>
</html>
