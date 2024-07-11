<%@ Page Title="BullCoin - Informes" Language="C#" MasterPageFile="~/myMaster.Master" AutoEventWireup="true" CodeBehind="reports.aspx.cs" Inherits="BullCoin.reports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/pages/reports.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-container">
        <main style="min-height: 100vh;">
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
                            <li class="bread-crumb-item-active" aria-current="page">Informe
                            </li>
                        </ol>
                    </nav>
                </section>
                <!-- Seccion informes -->
                <%if (Session["idUsuario"] != null)
                    {%>

                <section class="informes-section">
                    <div class="tablero-cotizaciones">
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





                        <div class="grafico-cotizacion">
                            <h3 class="titulo-informe">Informe</h3>
                            <div class="chart-container" id="chartContainer">
                                <asp:HiddenField ID="hfData" runat="server" />
                                <canvas id="cotizaciones-chart"></canvas>
                            </div>
                        </div>



                        <div class="datos-moneda">
                            <div class="tabla-cotizaciones">
                                <asp:GridView ID="gvCotizaciones" runat="server" AutoGenerateColumns="false" OnRowDataBound="gvCotizaciones_RowDataBound">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Moneda">
                                            <ItemTemplate>
                                                <asp:Label ID="lblMonedaCasa" runat="server" Text='<%# Eval("moneda") +  " " + Eval("nombre") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField HeaderText="Fecha" DataField="fechaActualizacion" DataFormatString="{0:yyyy, MMMM dd}" HtmlEncode="false" />
                                        <asp:BoundField HeaderText="Compra" DataField="compra" />
                                        <asp:BoundField HeaderText="Venta" DataField="venta" />
                                        <asp:TemplateField HeaderText="Variación">
                                            <ItemTemplate>
                                                <asp:Label ID="lblVariacion" runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </section>
                <% } %>
            </div>
        </main>
    </div>
    <script src="js/pages/reports.js"></script>
</asp:Content>
