<%@ Page Title="Home" Language="C#" MasterPageFile="~/myMaster.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="BullCoin._default" Async="true"  EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/pages/default.css" rel="stylesheet" />
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
                            <li class="bread-crumb-item-active" aria-current="page">Inicio</li>
                        </ol>
                    </nav>
                </section>
                <section class="pizarra-section">
                    <div class="pizarra-cotizaciones">
                        <div class="cotizaciones-title">
                            <h2>PIZARRA DE COTIZACIONES</h2>
                        </div>
                        <div class="selector-monedas-container">
                            <div class="nombre-bandera">
                                <div class="flag">
                                    <asp:Image ID="flagImg" runat="server" />
                                </div>
                                <asp:Label ID="flagNombre" runat="server" Text="Todas" CssClass="nombre"></asp:Label>
                            </div>
                            <asp:DropDownList ID="selectorMoneda" runat="server" OnSelectedIndexChanged="selectorMoneda_SelectedIndexChanged" AutoPostBack="true">
                                <asp:ListItem Value="-1">Seleccione una opción</asp:ListItem>
                                <asp:ListItem Value="0">Todas</asp:ListItem>
                                <asp:ListItem Value="1"> Dólar Oficial </asp:ListItem>
                                <asp:ListItem Value="2"> Dólar Blue </asp:ListItem>
                                <asp:ListItem Value="3"> Dólar Bolsa (MEP) </asp:ListItem>
                                <asp:ListItem Value="4"> Dólar Contado con Liqui (CCL) </asp:ListItem>
                                <asp:ListItem Value="5"> Dólar Mayorista </asp:ListItem>
                                <asp:ListItem Value="6"> Dólar Cripto </asp:ListItem>
                                <asp:ListItem Value="7"> Dólar Tarjeta </asp:ListItem>
                                <asp:ListItem Value="8"> Euro </asp:ListItem>
                                <asp:ListItem Value="9"> Real Brasileño </asp:ListItem>
                                <asp:ListItem Value="10"> Peso Chileno </asp:ListItem>
                                <asp:ListItem Value="11"> Peso Uruguayo </asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="fecha-hora">
                            <p>
                                Datos Actualizados al 
                                <asp:Label ID="lblFecha" runat="server" Text=""></asp:Label>
                            </p>
                        </div>

                        <div class="monedas-container-grid">
                            <% 

                                if (selectedCoin >= 1 && selectedCoin <= 7)
                                {
                            %><div class="moneda-container">
                                <div class="moneda-card">
                                    <div class="moneda-title">
                                        <div class="flag-container">
                                            <img src="img/usd.svg" alt="dolar" />
                                        </div>
                                        <h4><%:ListCurrencies[selectedCoin - 1].moneda + " " + ListCurrencies[selectedCoin - 1].nombre%></h4>
                                    </div>
                                    <div class="moneda-body">
                                        <div class="moneda-compra">
                                            <div class="compra">
                                                <h5>COMPRA</h5>
                                                <span>$<%:ListCurrencies[selectedCoin - 1].compra %></span>
                                            </div>
                                        </div>
                                        <div class="moneda-venta">
                                            <div class="venta">
                                                <h5>VENTA</h5>
                                                <span>$<%:ListCurrencies[selectedCoin - 1].venta %></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="moneda-footer">
                                        <div class="favoritos">
                                            <asp:Button ID="btnGuardarFavorito" CssClass="btn-favorito" runat="server" Text="Guardar" OnClick="btnGuardarFavorito_Click" CommandArgument="<%# selectedCoin - 1 %>" />

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%
                                }
                                else if (selectedCoin == 8)
                                {
                            %><div class="moneda-container">
                                <div class="moneda-card">
                                    <div class="moneda-title">
                                        <div class="flag-container">
                                            <img src="img/eur.svg" alt="dolar" />
                                        </div>
                                        <h4><%:ListCurrencies[selectedCoin - 1].moneda + " " + ListCurrencies[selectedCoin - 1].nombre%></h4>
                                    </div>
                                    <div class="moneda-body">
                                        <div class="moneda-compra">
                                            <div class="compra">
                                                <h5>COMPRA</h5>
                                                <span>$<%:ListCurrencies[selectedCoin - 1].compra %></span>
                                            </div>
                                        </div>
                                        <div class="moneda-venta">
                                            <div class="venta">
                                                <h5>VENTA</h5>
                                                <span>$<%:ListCurrencies[selectedCoin - 1].venta %></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="moneda-footer">
                                        <div class="favoritos">
                                            <asp:Button ID="Button1" CssClass="btn-favorito" runat="server" Text="Guardar" OnClick="btnGuardarFavorito_Click" CommandArgument="<%# selectedCoin - 1 %>" />

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%
                                }
                                else if (selectedCoin == 9)
                                {
                            %><div class="moneda-container">
                                <div class="moneda-card">
                                    <div class="moneda-title">
                                        <div class="flag-container">
                                            <img src="img/brl.svg" alt="dolar" />
                                        </div>
                                        <h4><%:ListCurrencies[selectedCoin - 1].moneda + " " + ListCurrencies[selectedCoin - 1].nombre%></h4>
                                    </div>
                                    <div class="moneda-body">
                                        <div class="moneda-compra">
                                            <div class="compra">
                                                <h5>COMPRA</h5>
                                                <span>$<%:ListCurrencies[selectedCoin - 1].compra %></span>
                                            </div>
                                        </div>
                                        <div class="moneda-venta">
                                            <div class="venta">
                                                <h5>VENTA</h5>
                                                <span>$<%:ListCurrencies[selectedCoin - 1].venta %></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="moneda-footer">
                                        <div class="favoritos">
                                            <asp:Button ID="Button2" CssClass="btn-favorito" runat="server" Text="Guardar" OnClick="btnGuardarFavorito_Click" CommandArgument="<%# selectedCoin - 1 %>" />

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%
                                }
                                else if (selectedCoin == 10)
                                {
                            %><div class="moneda-container">
                                <div class="moneda-card">
                                    <div class="moneda-title">
                                        <div class="flag-container">
                                            <img src="img/clp.svg" alt="dolar" />
                                        </div>
                                        <h4><%:ListCurrencies[selectedCoin - 1].moneda + " " + ListCurrencies[selectedCoin - 1].nombre%></h4>
                                    </div>
                                    <div class="moneda-body">
                                        <div class="moneda-compra">
                                            <div class="compra">
                                                <h5>COMPRA</h5>
                                                <span>$<%:ListCurrencies[selectedCoin - 1].compra %></span>
                                            </div>
                                        </div>
                                        <div class="moneda-venta">
                                            <div class="venta">
                                                <h5>VENTA</h5>
                                                <span>$<%:ListCurrencies[selectedCoin - 1].venta %></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="moneda-footer">
                                        <div class="favoritos">
                                            <asp:Button ID="Button3" CssClass="btn-favorito" runat="server" Text="Guardar" OnClick="btnGuardarFavorito_Click" CommandArgument="<%# selectedCoin - 1 %>" />

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%
                                }
                                else if (selectedCoin == 11)
                                {
                            %><div class="moneda-container">
                                <div class="moneda-card">
                                    <div class="moneda-title">
                                        <div class="flag-container">
                                            <img src="img/uyu.svg" alt="dolar" />
                                        </div>
                                        <h4><%:ListCurrencies[selectedCoin - 1].moneda + " " + ListCurrencies[selectedCoin - 1].nombre%></h4>
                                    </div>
                                    <div class="moneda-body">
                                        <div class="moneda-compra">
                                            <div class="compra">
                                                <h5>COMPRA</h5>
                                                <span>$<%:ListCurrencies[selectedCoin - 1].compra %></span>
                                            </div>
                                        </div>
                                        <div class="moneda-venta">
                                            <div class="venta">
                                                <h5>VENTA</h5>
                                                <span>$<%:ListCurrencies[selectedCoin - 1].venta %></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="moneda-footer">
                                        <div class="favoritos">
                                            <asp:Button ID="Button4" CssClass="btn-favorito" runat="server" Text="Guardar" OnClick="btnGuardarFavorito_Click" CommandArgument="<%# selectedCoin - 1 %>" />

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%
                                }
                                else
                                {
                            %>
                            <asp:Repeater ID="rptCurrencies" runat="server">
                                <ItemTemplate>
                                    <div class="moneda-container">
                                        <div class="moneda-card">
                                            <div class="moneda-title">
                                                <div class="flag-container">
                                                    <img src="img/<%# GetFlagImage(Eval("moneda").ToString()) %>" alt="" />
                                                </div>
                                                <h4><%# Eval("moneda") + " " + Eval("nombre") %></h4>
                                            </div>
                                            <div class="moneda-body">
                                                <div class="moneda-compra">
                                                    <div class="compra">
                                                        <h5>COMPRA</h5>
                                                        <span>$<%# Eval("compra") %></span>
                                                    </div>
                                                </div>
                                                <div class="moneda-venta">
                                                    <div class="venta">
                                                        <h5>VENTA</h5>
                                                        <span>$<%# Eval("venta") %></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="moneda-footer">
                                                <div class="favoritos">
                                                    <asp:Button ID="btnGuardarFavorito" CssClass="btn-favorito" runat="server" Text="Guardar" OnClick="btnGuardarFavorito_Click" CommandArgument='<%# Container.ItemIndex %>' />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <%
                                }
                            %>
                        </div>
                        <div class="aviso-favoritos">
                            <p>
                                !Haga clic en el marcador para guardar los datos de la
                  cotización en sus favoritos.
                            </p>
                            <p>
                                Datos obtenidos de
                  <span><a href="https://dolarapi.com/docs">DolarApi.com</a></span>
                            </p>
                        </div>
                    </div>
                </section>
                <section class="comentarios-section">
                    <h2>Comentarios</h2>
                    <div class="comentarios-container">
                        <div class="comentario">
                            <div class="comentario-header">
                                <img src="img/bullCoinIcono.jpg" alt="Imagen de Usuario" />
                            </div>
                            <div class="comentario-body">
                                <h4>Nombre Usuario</h4>
                                <p>
                                    Lorem ipsum dolor sit amet consectetur adipisicing elit. At
                    blanditiis maiores perferen
                                </p>
                            </div>
                        </div>
                        <div class="comentario">
                            <div class="comentario-header">
                                <img src="img/bullCoinIcono.jpg" alt="Imagen de Usuario" />
                            </div>
                            <div class="comentario-body">
                                <h4>Nombre Usuario</h4>
                                <p>
                                    Lorem ipsum dolor sit amet consectetur adipisicing elit. At
                    blanditiis maiores perferen
                                </p>
                            </div>
                        </div>
                        <div class="comentario">
                            <div class="comentario-header">
                                <img src="img/bullCoinIcono.jpg" alt="Imagen de Usuario" />
                            </div>
                            <div class="comentario-body">
                                <h4>Nombre Usuario</h4>
                                <p>
                                    Lorem ipsum dolor sit amet consectetur adipisicing elit. At
                    blanditiis maiores perferen
                                </p>
                            </div>
                        </div>
                        <div class="comentario">
                            <div class="comentario-header">
                                <img src="img/bullCoinIcono.jpg" alt="Imagen de Usuario" />
                            </div>
                            <div class="comentario-body">
                                <h4>Nombre Usuario</h4>
                                <p>
                                    Lorem ipsum dolor sit amet consectetur adipisicing elit. At
                    blanditiis maiores perferen
                                </p>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </main>
    </div>
</asp:Content>
