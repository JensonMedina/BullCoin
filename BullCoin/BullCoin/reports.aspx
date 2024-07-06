﻿<%@ Page Title="BullCoin - Informes" Language="C#" MasterPageFile="~/myMaster.Master" AutoEventWireup="true" CodeBehind="reports.aspx.cs" Inherits="BullCoin.reports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/pages/reports.css" rel="stylesheet" />
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
              <div class="title"><h1>BullCoin</h1></div>
            </div>
          </section>
          <section class="bread-crumb-section">
            <nav class="bread-crumb-container">
              <ol class="bread-crumb">
                <li aria-current="page">Inicio</li>
                <li class="bread-crumb-item-active" aria-current="page">
                  Informe
                </li>
              </ol>
            </nav>
          </section>
          <!-- Seccion informes -->
          <section class="informes-section">
            <div class="tablero-cotizaciones">
              <div class="selector-monedas-container">
                <div class="nombre-bandera" id="nombre-bandera">
                  <div class="flag">
                    <img src="img/noun-world-2699516.svg" alt="" />
                  </div>
                  <div class="nombre">Todas</div>
                </div>
                <label for="">Seleccione una opción</label>
                <div class="selector-moneda-btn-container">
                  <button class="btn-selector-moneda" id="btn-selector-moneda">
                    <div class="icono-selector">
                      <i class="fa-solid fa-chevron-down"></i>
                    </div>
                  </button>
                </div>
              </div>
              <div class="selector-container" id="selector-container">
                <div class="selector-option-container" data-currency="0">
                  <div class="selector-option">
                    <div class="flag-img">
                      <img src="img/noun-world-2699516.svg" alt="" />
                    </div>
                    <h4>Todas</h4>
                  </div>
                  <span><i class="fa-solid fa-check"></i></span>
                </div>
                <div class="selector-option-container" data-currency="1">
                  <div class="selector-option">
                    <div class="flag-img">
                      <img src="img/usd.svg" alt="" />
                    </div>
                    <h4>Dólar Oficial</h4>
                  </div>
                  <span></span>
                </div>
                <div class="selector-option-container" data-currency="2">
                  <div class="selector-option">
                    <div class="flag-img">
                      <img src="img/usd.svg" alt="" />
                    </div>
                    <h4>Dólar Blue</h4>
                  </div>
                  <span></span>
                </div>
                <div class="selector-option-container" data-currency="3">
                  <div class="selector-option">
                    <div class="flag-img">
                      <img src="img/usd.svg" alt="" />
                    </div>
                    <h4>Dólar Bolsa</h4>
                  </div>
                  <span></span>
                </div>
                <div class="selector-option-container" data-currency="4">
                  <div class="selector-option">
                    <div class="flag-img">
                      <img src="img/usd.svg" alt="" />
                    </div>
                    <h4>Dólar CCL</h4>
                  </div>
                  <span></span>
                </div>

                <div class="selector-option-container" data-currency="5">
                  <div class="selector-option">
                    <div class="flag-img">
                      <img src="img/usd.svg" alt="" />
                    </div>
                    <h4>Dólar Mayorista</h4>
                  </div>
                  <span></span>
                </div>
                <div class="selector-option-container" data-currency="6">
                  <div class="selector-option">
                    <div class="flag-img">
                      <img src="img/usd.svg" alt="" />
                    </div>
                    <h4>Dólar Cripto</h4>
                  </div>
                  <span></span>
                </div>
                <div class="selector-option-container" data-currency="7">
                  <div class="selector-option">
                    <div class="flag-img">
                      <img src="img/usd.svg" alt="" />
                    </div>
                    <h4>Dólar Tarjeta</h4>
                  </div>
                  <span></span>
                </div>
                <div class="selector-option-container" data-currency="8">
                  <div class="selector-option">
                    <div class="flag-img">
                      <img src="img/eur.svg" alt="" />
                    </div>
                    <h4>Eur</h4>
                  </div>
                  <span></span>
                </div>
                <div class="selector-option-container" data-currency="9">
                  <div class="selector-option">
                    <div class="flag-img">
                      <img src="img/brl.svg" alt="" />
                    </div>
                    <h4>Real Brasileño</h4>
                  </div>
                  <span></span>
                </div>
                <div class="selector-option-container" data-currency="10">
                  <div class="selector-option">
                    <div class="flag-img">
                      <img src="img/clp.svg" alt="" />
                    </div>
                    <h4>Peso Chileno</h4>
                  </div>
                  <span></span>
                </div>
                <div class="selector-option-container" data-currency="11">
                  <div class="selector-option">
                    <div class="flag-img">
                      <img src="img/uyu.svg" alt="" />
                    </div>
                    <h4>Peso Uruguayo</h4>
                  </div>
                  <span></span>
                </div>
              </div>
              <div class="grafico-cotizacion">
                <h3 class="titulo-informe">Informe</h3>
                <div class="chart-container">
                  <canvas id="cotizaciones-chart"></canvas>
                </div>
              </div>

              
              <button id="link-compartir-info"><i class="fa-solid fa-envelope"></i> Compartir Información</button>
              <!-- <div id="modal" class="modal">
                <div class="modal-content">
                  <span class="close-button">&times;</span>
                  <h2>Compartir Información</h2>
                  <form id="formularioCompartir">
                    <label for="name">Nombre:</label>
                    <input type="text" id="name" name="name" required />
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required />
                    <div class="modal-buttons">
                      <button type="button" class="close-button">Cerrar</button>
                      <button type="submit">Enviar</button>
                    </div>
                  </form>
                </div>
              </div> -->

              <div class="datos-moneda">
                <div class="tabla-cotizaciones">
                  <table id="cotizaciones-table">
                    <thead>
                      <tr>
                        <th>Moneda</th>
                        <th>Fecha</th>
                        <th>Compra</th>
                        <th>Venta</th>
                        <th>Variación</th>
                      </tr>
                    </thead>

                    <tbody id="table-body">
                      <!-- Las filas se generarán dinámicamente -->
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </section>
        </div>
      </main>
    </div>
</asp:Content>
