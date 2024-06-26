﻿<%@ Page Title="BullCoin - Contacto" Language="C#" MasterPageFile="~/myMaster.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="BullCoin.contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/pages/contact.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-container">
      <main>
        <div class="main">
          <section class="img-background-section">
            <div class="img-background" id="BackgroundDinamico" >
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
                  Contacto
                </li>
              </ol>
            </nav>
          </section>
          <!-- Esto va abajo de la section del migas de pan -->
          <section class="form-section">
            <div class="contacto-web-seccion">
              <h1>Contacto Web Cotizaciones</h1>
              <div class="form-grid-container">
                <div class="form-container">
                  <h3>Datos de contacto</h3>
                  <form class="form-grid">
                    <div class="row-form">
                      <div><label for="nombre">Nombre</label></div>
                      <div><input type="text" id="nombre" name="nombre"></div>
                    </div>
                    <div class="row-form">
                      <div><label for="email">Email</label></div>
                      <div><input type="email" id="email" name="email"></div>
                    </div>
                    <div class="row-form">
                      <div><label for="mensaje">Mensaje</label></div>
                      <div><textarea name="mensaje" id="mensaje" cols="4" rows="8"></textarea></div>
                    </div>
                    <div class="row-form">
                      <label id="lblValidacion"></label>
                    </div>
                    
                  </form>
                  <div class="row-buttons">
                    <button class="btn btn-enviar" onclick="EnviarFormulario()">Enviar</button>
                    <button class="btn btn-limpiar" onclick="LimpiarFormulario()">Limpiar</button>
                  </div>
                </div>
                <div class="datos-contacto">
                  <div class="text-content">
                    <p>
                      Si tiene alguna sugerencia o inconveniente por favor
                      complete el siguiente formulario y envíenoslo. Lo
                      contactaremos a la brevedad.
                    </p>
                    <br>
                    <p>
                      Esta web está desarrollada utilizando
                      <a href="https://dolarapi.com/">https://dolarapi.com/</a>
                    </p>
                  </div>

                  <div class="datos-container">
                    <div class="datos-container-content">
                      <h3>DATOS DE CONTACTO</h3>
                      <p>Universidad Tecnológica Nacional</p>
                      <p>ZEBALLOS 1341 - S2000BQA</p>
                      <p>ROSARIO</p>
                      <p>Tel: 0341 - 4481871</p>
                    </div>
                    <div class="datos-container-img">
                      <img src="img/logo-utn-siglas.png" alt="">
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

