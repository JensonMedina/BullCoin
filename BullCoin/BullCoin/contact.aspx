<%@ Page Title="BullCoin - Contacto" Language="C#" MasterPageFile="~/myMaster.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="BullCoin.contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/pages/contact.css" rel="stylesheet" />
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
                            <li aria-current="page">Inicio
                            </li>
                            <li class="bread-crumb-item-active" aria-current="page">Contacto
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
                                <%--<form class="form-grid" id="contact-form">--%>
                                    <div class="row-form">
                                        <div>
                                            <label for="user_name">Nombre</label></div>
                                        <div>
                                            <input type="text" id="user_name" name="user_name"></div>
                                    </div>
                                    <div class="row-form">
                                        <div>
                                            <label for="user_email">Email</label></div>
                                        <div>
                                            <input type="email" id="user_email" name="user_email"></div>
                                    </div>
                                    <div class="row-form">
                                        <div>
                                            <label for="message">Mensaje</label></div>
                                        <div>
                                            <textarea name="message" id="message" cols="4" rows="8"></textarea></div>
                                    </div>
                                    <div class="row-form">
                                        <label id="lblValidacion"></label>
                                    </div>
                                    <div class="row-buttons">
                                        <button class="btn btn-enviar" onclick="EnviarFormulario()" type="submit">Enviar</button>
                                        <button class="btn btn-limpiar" onclick="LimpiarFormulario()" type="button">Limpiar</button>
                                    </div>
                                <%--</form>--%>
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
    <script src="js/pages/contact.js"></script>
</asp:Content>

