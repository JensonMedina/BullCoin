using Data;
using Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BullCoin
{
    public partial class reports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["idUsuario"] != null)
            {
                int idUsuario = (int)Session["idUsuario"];
                if (!IsPostBack)
                {
                    loadGridView(idUsuario);
                    flagImg.ImageUrl = "img/noun-world-2699516.svg";
                    string script = $"<script>showGraph({0});</script>";
                    ClientScript.RegisterStartupScript(this.GetType(), "showGraph", script, false);
                }
            }
            else
            {
                //no se ha iniciado sesión.
                string script = "<script>userNotLoggedIn();</script>"; // Nombre de tu función JavaScript
                ClientScript.RegisterStartupScript(this.GetType(), "userNotLoggedIn", script);
            }
            
        }
        private void loadGridView(int idUsuario)
        {
            try
            {
                List<Currency> currencies = loadCurrencies(idUsuario);
                if(currencies.Count > 0)
                {
                    currencies = currencies.OrderByDescending(a => a.fechaActualizacion).ToList();
                    gvCotizaciones.DataSource = currencies;
                    gvCotizaciones.DataBind();
                    JavaScriptSerializer serializer = new JavaScriptSerializer();
                    hfData.Value = serializer.Serialize(currencies);
                }
                else
                {
                    string script = "<script>noCurrenciesSaved();</script>"; // Nombre de tu función JavaScript
                    ClientScript.RegisterStartupScript(this.GetType(), "noCurrenciesSaved", script);
                }
                
            }
            catch (Exception)
            {

                throw;
            }
        }
        private List<Currency> loadCurrencies(int idUsuario)
        {
            CurrencyData data = new CurrencyData();
            try
            {
                return data.ListCurrencies(idUsuario);
            }
            catch (Exception)
            {

                throw;
            }
        }
        protected void gvCotizaciones_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Currency actualCurrency = (Currency)e.Row.DataItem;
                Label lblVariacion = (Label)e.Row.FindControl("lblVariacion");

                if (lblVariacion != null)
                {
                    int idUsuario = (int)Session["idUsuario"];
                    List<Currency> currencies = loadCurrencies(idUsuario);
                    List<Currency> previousData = currencies.Where(item => item.moneda == actualCurrency.moneda && item.casa == actualCurrency.casa && item.fechaActualizacion < actualCurrency.fechaActualizacion).ToList();

                    if (previousData.Count > 0)
                    {
                        Currency lastRegister = previousData[previousData.Count - 1];
                        if (actualCurrency.compra > lastRegister.compra)
                        {
                            lblVariacion.Text = "↑";
                            lblVariacion.ForeColor = System.Drawing.Color.Green;
                        }
                        else if (actualCurrency.compra < lastRegister.compra)
                        {
                            lblVariacion.Text = "↓"; // Icono de flecha hacia abajo
                            lblVariacion.ForeColor = System.Drawing.Color.Red;
                        }
                        else
                        {
                            lblVariacion.Text = "-"; // Sin cambios
                        }
                    }
                    else
                    {
                        lblVariacion.Text = "-"; // No hay datos previos para comparar
                    }
                }
            }
        }

        protected void selectorMoneda_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int idUsuario = (int)Session["idUsuario"];
                List<Currency> currencies = loadCurrencies(idUsuario);
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                int selectedValue = int.Parse(selectorMoneda.SelectedValue);

                switch (selectedValue)
                {
                    case 1:
                        flagNombre.Text = "USD";
                        flagImg.ImageUrl = "img/usd.svg";
                        hfData.Value = serializer.Serialize(currencies.Where(item => item.moneda == "USD" && item.casa == "oficial").ToList());
                        break;
                    case 2:
                        flagNombre.Text = "USD";
                        flagImg.ImageUrl = "img/usd.svg";
                        hfData.Value = serializer.Serialize(currencies.Where(item => item.moneda == "USD" && item.casa == "blue").ToList());
                        break;
                    case 3:
                        flagNombre.Text = "USD";
                        flagImg.ImageUrl = "img/usd.svg";
                        hfData.Value = serializer.Serialize(currencies.Where(item => item.moneda == "USD" && item.casa == "bolsa").ToList());
                        break;
                    case 4:
                        flagNombre.Text = "USD";
                        flagImg.ImageUrl = "img/usd.svg";
                        hfData.Value = serializer.Serialize(currencies.Where(item => item.moneda == "USD" && item.casa == "contadoconliqui").ToList());
                        break;
                    case 5:
                        flagNombre.Text = "USD";
                        flagImg.ImageUrl = "img/usd.svg";
                        hfData.Value = serializer.Serialize(currencies.Where(item => item.moneda == "USD" && item.casa == "mayorista").ToList());
                        break;
                    case 6:
                        flagNombre.Text = "USD";
                        flagImg.ImageUrl = "img/usd.svg";
                        hfData.Value = serializer.Serialize(currencies.Where(item => item.moneda == "USD" && item.casa == "cripto").ToList());
                        break;
                    case 7:
                        flagNombre.Text = "USD";
                        flagImg.ImageUrl = "img/usd.svg";
                        hfData.Value = serializer.Serialize(currencies.Where(item => item.moneda == "USD" && item.casa == "tarjeta").ToList());
                        break;
                    case 8:
                        flagNombre.Text = "EUR";
                        flagImg.ImageUrl = "img/eur.svg";
                        hfData.Value = serializer.Serialize(currencies.Where(item => item.moneda == "EUR").ToList());
                        break;
                    case 9:
                        flagNombre.Text = "BRL";
                        flagImg.ImageUrl = "img/brl.svg";
                        hfData.Value = serializer.Serialize(currencies.Where(item => item.moneda == "BRL").ToList());
                        break;
                    case 10:
                        flagNombre.Text = "CLP";
                        flagImg.ImageUrl = "img/clp.svg";
                        hfData.Value = serializer.Serialize(currencies.Where(item => item.moneda == "CLP").ToList());
                        break;
                    case 11:
                        flagNombre.Text = "UYU";
                        flagImg.ImageUrl = "img/uyu.svg";
                        hfData.Value = serializer.Serialize(currencies.Where(item => item.moneda == "UYU").ToList());
                        break;
                    default:
                        flagNombre.Text = "Todas";
                        flagImg.ImageUrl = "img/noun-world-2699516.svg";
                        hfData.Value = serializer.Serialize(currencies);
                        break;
                }
                
                string script = $"<script>showGraph({selectedValue});</script>";
                ClientScript.RegisterStartupScript(this.GetType(), "showGraph", script, false);
            }
            catch (Exception)
            {

                throw;
            }
            

        }



    }
}