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
                        <div class="fecha-monedas">
                            <% 
                                string currentFecha = null;
                                if (Currencies.Count > 0)
                                {
                                    foreach (var currency in Currencies)
                                    {
                                        if (currentFecha != currency.fechaActualizacion.ToShortDateString())
                                        {
                                            if (currentFecha != null)
                                            {
                            %>
                        </div>
                        <!-- Cierre del div .tarjetas anterior -->
                        <%
                            }
                            currentFecha = currency.fechaActualizacion.ToShortDateString();
                        %><div class="fecha">
                            <%: currency.fechaActualizacion.ToShortDateString() %>
                        </div>
                        <div class="tarjetas">
                            <%
                                }
                            %><div class="tarjeta">
                                <div class="tarjeta-header">
                                    <div class="tarjeta-img-container">
                                        <img src="img/<%: currency.bandera %>" alt="" />
                                    </div>
                                    <div class="title"><%: currency.nombre %></div>
                                </div>
                                <div class="tarjeta-body">
                                    <div class="compra item-tarjeta">
                                        <span>Compra</span>
                                        <span>$<%: currency.compra %></span>
                                    </div>
                                    <div class="venta item-tarjeta">
                                        <span>Venta</span>
                                        <span>$<%: currency.venta %></span>
                                    </div>
                                </div>
                                <div class="tarjeta-footer">
                                    <div class="btn-container">
                                        <asp:Button ID="Button1" CssClass="btn-Eliminar" runat="server" Text="Eliminar" />
                                    </div>
                                </div>
                            </div>
                            <% 
                                    }
                                }
                                else
                                {
                            %><div>No hay cotizaciones guardadas.</div>
                            <%
                                }

                            %>
                        </div>
                        <!-- Cierre del ultimo div .tarjetas -->
                    </div>

                </section>
            </div>
        </main>
    </div>
</asp:Content>
