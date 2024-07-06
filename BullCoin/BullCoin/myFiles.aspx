<%@ Page Title="BullCoin - Mis archivos" Language="C#" MasterPageFile="~/myMaster.Master" AutoEventWireup="true" CodeBehind="myFiles.aspx.cs" Inherits="BullCoin.myFiles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/pages/myFiles.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-container">
        <main>
            <div class="main">
                <section class="img-background-section">
                    <div class="img-background" id="BackgroundDinamico">
                        <div class="img-container">
                            <img src="img/bullCoinIcono.jpg" alt="Logo web" />
                        </div>
                        <div class="title">
                            <h1>BullCoin</h1>
                        </div>
                    </div>
                </section>
                <section class="bread-crumb-section">
                    <nav class="bread-crumb-container">
                        <ol class="bread-crumb">
                            <li aria-current="page">Inicio</li>
                            <li class="bread-crumb-item-active" aria-current="page">Mi Archivo
                            </li>
                        </ol>
                    </nav>
                </section>
                <section class="archivos-section">
                    <div class="container">
                        <asp:Repeater ID="rptFechas" runat="server">
                            <ItemTemplate>
                                <div class="fecha"><%# Convert.ToDateTime(Eval("Fecha")).ToString("d MMMM yyyy") %></div>
                                <div class="tarjetas-container">
                                    <asp:Repeater ID="rptCurrencies" runat="server" DataSource='<%# Eval("Currencies") %>'>
                                        <ItemTemplate>
                                            <asp:HiddenField ID="hnfId" runat="server" Value='<%# Eval("id") %>' />
                                            <div class="tarjeta">
                                                <div class="tarjeta-header">
                                                    <div class="tarjeta-img-container">
                                                        <img src="img/<%# Eval("bandera") %>" alt="" />
                                                    </div>
                                                    <div class="title"><%# Eval("moneda") + " " +  Eval("nombre") %></div>
                                                </div>
                                                <div class="tarjeta-body">
                                                    <div class="compra item-tarjeta">
                                                        <span>Compra</span>
                                                        <span>$<%# Eval("compra") %></span>
                                                    </div>
                                                    <div class="venta item-tarjeta">
                                                        <span>Venta</span>
                                                        <span>$<%# Eval("venta") %></span>
                                                    </div>
                                                </div>
                                                <div class="tarjeta-footer">
                                                    <div class="btn-container">
                                                        <asp:Button ID="btnEliminar" CssClass="btn-eliminar" runat="server" Text="Eliminar" OnClick="btnEliminar_Click" />
                                                    </div>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </section>
            </div>
        </main>
    </div>
</asp:Content>

