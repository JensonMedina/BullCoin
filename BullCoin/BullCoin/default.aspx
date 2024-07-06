<%@ Page Title="Home" Language="C#" MasterPageFile="~/myMaster.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="BullCoin._default" Async="true"  EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/pages/default.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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

                        <div class="monedas-container">
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
                <!-- Sección comentarios -->
          <section class="comentarios-section">
            <h2>Comentarios</h2>
            <div class="slider-container">
              <button class="button-comentarios prev">Prev</button>
              <div class="slider">
                <div class="card-comentarios">
                  <img
                    src="img/juan.jpg"
                    alt="Foto de usuario"
                  />
                  <h3>Juan</h3>
                  <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Commodi impedit illo ipsum. Cumque, laboriosam. Sint, suscipit, consectetur repudiandae est nulla itaque nostrum incidunt, enim excepturi maiores laboriosam natus fugiat hic.</p>
                </div>
                <div class="card-comentarios">
                  <img
                    src="img/Carrmen.jpg"
                    alt="Foto de usuario"
                  />
                  <h3>Carmen</h3>
                  <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Ad ipsam quos esse error vero fuga pariatur est odit, blanditiis ipsa iste incidunt culpa inventore similique ratione laborum laboriosam sapiente dolorum.</p>
                </div>
                <div class="card-comentarios">
                  <img
                    src="img/nicolas.jpg"
                    alt="Foto de usuario"
                  />
                  <h3>Nicolas</h3>
                  <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Commodi impedit illo ipsum. Cumque, laboriosam. Sint, suscipit, consectetur repudiandae est nulla itaque nostrum incidunt, enim excepturi maiores laboriosam natus fugiat hic.</p>
                </div>
                <div class="card-comentarios">
                  <img
                    src="img/maria.jpg"
                    alt="Foto de usuario"
                  />
                  <h3>Maria</h3>
                  <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Ad ipsam quos esse error vero fuga pariatur est odit, blanditiis ipsa iste incidunt culpa inventore similique ratione laborum laboriosam sapiente dolorum.</p>
                </div>
                <div class="card-comentarios">
                  <img
                    src="img/jesus.jpg"
                    alt="Foto de usuario"
                  />
                  <h3>Jesus</h3>
                  <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Commodi impedit illo ipsum. Cumque, laboriosam. Sint, suscipit, consectetur repudiandae est nulla itaque nostrum incidunt, enim excepturi maiores laboriosam natus fugiat hic.</p>
                </div>
                <div class="card-comentarios">
                  <img
                    src="img/gabriela.jpg"
                    alt="Foto de usuario"
                  />
                  <h3>Gabriela</h3>
                  <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Ad ipsam quos esse error vero fuga pariatur est odit, blanditiis ipsa iste incidunt culpa inventore similique ratione laborum laboriosam sapiente dolorum.</p>
                </div>
                <div class="card-comentarios">
                  <img
                    src="img/ricardo.jpg"
                    alt="Foto de usuario"
                  />
                  <h3>Ricardo</h3>
                  <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Commodi impedit illo ipsum. Cumque, laboriosam. Sint, suscipit, consectetur repudiandae est nulla itaque nostrum incidunt, enim excepturi maiores laboriosam natus fugiat hic.</p>
                </div>
                <div class="card-comentarios">
                  <img
                    src="img/luciana.jpg"
                    alt="Foto de usuario"
                  />
                  <h3>Luciana</h3>
                  <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Ad ipsam quos esse error vero fuga pariatur est odit, blanditiis ipsa iste incidunt culpa inventore similique ratione laborum laboriosam sapiente dolorum.</p>
                </div>
                <div class="card-comentarios">
                  <img
                    src="img/matias.jpg"
                    alt="Foto de usuario"
                  />
                  <h3>Matias</h3>
                  <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Commodi impedit illo ipsum. Cumque, laboriosam. Sint, suscipit, consectetur repudiandae est nulla itaque nostrum incidunt, enim excepturi maiores laboriosam natus fugiat hic.</p>
                </div>
                <div class="card-comentarios">
                  <img
                    src="img/guadalupe.jpg"
                    alt="Foto de usuario"
                  />
                  <h3>Guadalupe</h3>
                  <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Ad ipsam quos esse error vero fuga pariatur est odit, blanditiis ipsa iste incidunt culpa inventore similique ratione laborum laboriosam sapiente dolorum.</p>
                </div>
     
              </div>
              <button class="button-comentarios next">Next</button>
            </div>
          </section>
            </div>
        </main>
    </div>

    <script src="js/pages/default.js"></script>
</asp:Content>
