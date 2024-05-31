<%@ Page Title="BullCoin - Informes" Language="C#" MasterPageFile="~/myMaster.Master" AutoEventWireup="true" CodeBehind="reports.aspx.cs" Inherits="BullCoin.reports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/pages/reports.css" rel="stylesheet" />
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
              <div class="title"><h1>BullCoin</h1></div>
            </div>
          </section>
          <section class="bread-crumb-section">
            <nav class="bread-crumb-container">
              <ol class="bread-crumb">
                <li aria-current="page">
                  Inicio
                </li>
                <li class="bread-crumb-item-active" aria-current="page">
                  Informe
                </li>
              </ol>
            </nav>
          </section>
          <section class="informes-section">
            <div class="tablero-cotizaciones">
              <div class="grafico-selector">
                <div class="selector-monedas-container">
                  <div class="nombre-bandera">
                    <div class="flag">
                      <img src="img/eur.svg" alt="" />
                    </div>
                    <div class="nombre">Euro</div>
                  </div>
                  <select name="selector-moneda" id="selcetor-moneda">
                    <option value="0">Seleccione una opción</option>
                    <option value="todas">Todas</option>
                    <option value="oficial">Dólar oficial</option>
                    <option value="blue">Dólar Blue</option>
                    <option value="mep">Dólar Bolsa (MEP)</option>
                    <option value="liqui">Dólar Contado con Liqui (CCL)</option>
                    <option value="tarjeta">Dólar Tarjeta</option>
                    <option value="mayorista">Dólar Mayorista</option>
                    <option value="cripto">Dólar Cripto</option>
                    <option value="euro">Euro</option>
                    <option value="real">Real Brasileño</option>
                    <option value="chile">Peso Chileno</option>
                    <option value="uyu">Peso Uruguayo</option>
                  </select>
                  <!-- esto lo dejo comentado porque despues lo vamos a usar con js -->
                  <!-- <input type="text" class="selector-moneda" value="Euro" />
                  <div class="selector-moneda-btn-container">
                    <button class="btn-selector-moneda">
                      <div class="icono-selector">
                        <i class="fa-solid fa-chevron-down"></i>
                      </div>
                    </button>
                  </div> -->
                </div>
                <div class="grafico-cotizacion">
                  <!-- Gráfico  -->
                  <h3>Informe</h3>
                  <div class="img-grafico-container">
                    <img src="img/grafico.jpg" alt="Gráfico de cotización" />
                  </div>
                </div>
              </div>
              <div class="compartir-info">
                <a href="#">
                  <i class="fa-solid fa-envelope"></i> Compartir Información
                </a>
              </div>

              <div class="datos-moneda">
                <div class="tabla-cotizaciones">
                  <div class="encabezado fila-cotizaciones">
                    <div><h3>Moneda</h3></div>
                    <div><h3>Fecha</h3></div>
                    <div><h3>Compra</h3></div>
                    <div><h3>Venta</h3></div>
                    <div><h3>Variación</h3></div>
                  </div>
                  <div class="informe-cotizaciones">
                    <div class="fila-tipo-moneda">
                      <div class="flag-container"><img src="img/usd.svg" alt="bandera eeuu"></div>
                      <span>Dólar Blue</span>
                    </div>
                    <div class="fila-datos">
                      <div></div>
                      <div class="fecha columna-datos">
                        <ul>
                          <li><p>15/04/2024</p></li>
                          <li><p>15/04/2024</p></li>
                          <li><p>15/04/2024</p></li>
                          <li><p>15/04/2024</p></li>
                          <li><p>15/04/2024</p></li>
                        </ul>
                      </div>
  
                      <div class="compra columna-datos">
                        <ul>
                          <li><p>$1075</p></li>
                          <li><p>$1075</p></li>
                          <li><p>$1075</p></li>
                          <li><p>$1075</p></li>
                          <li><p>$1075</p></li>
                        </ul>
                      </div>
  
                      <div class="venta columna-datos">
                        <ul>
                          <li><p>$1075</p></li>
                          <li><p>$1075</p></li>
                          <li><p>$1075</p></li>
                          <li><p>$1075</p></li>
                          <li><p>$1075</p></li>
                        </ul>
                      </div>
  
                      <div class="accion columna-datos">
                        <ul>
                          <li>
                            <i class="fa-solid fa-arrow-up cambio-positivo"></i>
                          </li>
                          <li>
                            <i class="fa-solid fa-arrow-down cambio-negativo"></i>
                          </li>
                          <li>
                            <i class="fa-solid fa-arrow-up cambio-positivo"></i>
                          </li>
                          <li>
                            <i class="fa-solid fa-arrow-up cambio-positivo"></i>
                          </li>
                          <li>
                            <i class="fa-solid fa-arrow-up cambio-positivo"></i>
                          </li>
                        </ul>
                      </div>
                    </div>
                    <div class="fila-tipo-moneda">
                      <div class="flag-container"><img src="img/eur.svg" alt="bandera eeuu"></div>
                      <span>Euro</span>
                    </div>
                    <div class="fila-datos">
                      <div></div>
                      <div class="fecha columna-datos">
                        <ul>
                          <li><p>15/04/2024</p></li>
                          <li><p>15/04/2024</p></li>
                          <li><p>15/04/2024</p></li>
                          <li><p>15/04/2024</p></li>
                          <li><p>15/04/2024</p></li>
                        </ul>
                      </div>
  
                      <div class="compra columna-datos">
                        <ul>
                          <li><p>$1075</p></li>
                          <li><p>$1075</p></li>
                          <li><p>$1075</p></li>
                          <li><p>$1075</p></li>
                          <li><p>$1075</p></li>
                        </ul>
                      </div>
  
                      <div class="venta columna-datos">
                        <ul>
                          <li><p>$1075</p></li>
                          <li><p>$1075</p></li>
                          <li><p>$1075</p></li>
                          <li><p>$1075</p></li>
                          <li><p>$1075</p></li>
                        </ul>
                      </div>
  
                      <div class="accion columna-datos">
                        <ul>
                          <li>
                            <i class="fa-solid fa-arrow-up cambio-positivo"></i>
                          </li>
                          <li>
                            <i class="fa-solid fa-arrow-up cambio-positivo"></i>
                          </li>
                          <li>
                            <i class="fa-solid fa-arrow-up cambio-positivo"></i>
                          </li>
                          <li>
                            <i class="fa-solid fa-arrow-up cambio-positivo"></i>
                          </li>
                          <li>
                            <i class="fa-solid fa-arrow-up cambio-positivo"></i>
                          </li>
                        </ul>
                      </div>
                    </div>
                    <div class="fila-tipo-moneda">
                      <span>Dólar Blue</span>
                    </div>
                    <div class="fila-datos">
                      <div></div>
                      <div class="fecha columna-datos">
                        <ul>
                          <li><p>15/04/2024</p></li>
                          <li><p>15/04/2024</p></li>
                          <li><p>15/04/2024</p></li>
                          <li><p>15/04/2024</p></li>
                          <li><p>15/04/2024</p></li>
                        </ul>
                      </div>
  
                      <div class="compra columna-datos">
                        <ul>
                          <li><p>$1075</p></li>
                          <li><p>$1075</p></li>
                          <li><p>$1075</p></li>
                          <li><p>$1075</p></li>
                          <li><p>$1075</p></li>
                        </ul>
                      </div>
  
                      <div class="venta columna-datos">
                        <ul>
                          <li><p>$1075</p></li>
                          <li><p>$1075</p></li>
                          <li><p>$1075</p></li>
                          <li><p>$1075</p></li>
                          <li><p>$1075</p></li>
                        </ul>
                      </div>
  
                      <div class="accion columna-datos">
                        <ul>
                          <li>
                            <i class="fa-solid fa-arrow-up cambio-positivo"></i>
                          </li>
                          <li>
                            <i class="fa-solid fa-arrow-up cambio-positivo"></i>
                          </li>
                          <li>
                            <i class="fa-solid fa-arrow-up cambio-positivo"></i>
                          </li>
                          <li>
                            <i class="fa-solid fa-arrow-up cambio-positivo"></i>
                          </li>
                          <li>
                            <i class="fa-solid fa-arrow-up cambio-positivo"></i>
                          </li>
                        </ul>
                      </div>
                    </div>
                    <div class="fila-tipo-moneda">
                      <span>Dólar Blue</span>
                    </div>
                    <div class="fila-datos">
                      <div></div>
                      <div class="fecha columna-datos">
                        <ul>
                          <li><p>15/04/2024</p></li>
                          <li><p>15/04/2024</p></li>
                          <li><p>15/04/2024</p></li>
                          <li><p>15/04/2024</p></li>
                          <li><p>15/04/2024</p></li>
                        </ul>
                      </div>
  
                      <div class="compra columna-datos">
                        <ul>
                          <li><p>$1075</p></li>
                          <li><p>$1075</p></li>
                          <li><p>$1075</p></li>
                          <li><p>$1075</p></li>
                          <li><p>$1075</p></li>
                        </ul>
                      </div>
  
                      <div class="venta columna-datos">
                        <ul>
                          <li><p>$1075</p></li>
                          <li><p>$1075</p></li>
                          <li><p>$1075</p></li>
                          <li><p>$1075</p></li>
                          <li><p>$1075</p></li>
                        </ul>
                      </div>
  
                      <div class="accion columna-datos">
                        <ul>
                          <li>
                            <i class="fa-solid fa-arrow-up cambio-positivo"></i>
                          </li>
                          <li>
                            <i class="fa-solid fa-arrow-up cambio-positivo"></i>
                          </li>
                          <li>
                            <i class="fa-solid fa-arrow-up cambio-positivo"></i>
                          </li>
                          <li>
                            <i class="fa-solid fa-arrow-up cambio-positivo"></i>
                          </li>
                          <li>
                            <i class="fa-solid fa-arrow-up cambio-positivo"></i>
                          </li>
                        </ul>
                      </div>
                    </div>
                  </div>
                  
                </div>
              </div>
            </div>
          </section>
        </div>
      </main>
    </div>
</asp:Content>
