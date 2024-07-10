using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Web.UI;
using Domain;
using Data;
using System.Web.UI.WebControls;

namespace BullCoin
{
    public partial class _default : System.Web.UI.Page
    {
        public List<Currency> ListCurrencies { get; set; }
        public int selectedCoin { get; set; }
        private CurrenciesController currenciesController;
        private int IdUsuario = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            currenciesController = new CurrenciesController();
            if (!IsPostBack)
            {
                GetCurrencies();
                flagImg.ImageUrl = "img/noun-world-2699516.svg";
                
            }
            else
            {
                // En caso de postback, aseguramos que la lista no es nula
                if (ListCurrencies == null)
                {
                    GetCurrencies();
                }
            }
            if (Session["idUsuario"] != null)
            {
                IdUsuario = (int)Session["idUsuario"];
            }


        }
        private async void GetCurrencies()
        {
            ListCurrencies = await currenciesController.GetAllCurrencies();
            //despues de cargar la lista aprovecho para cargar la hora, para eso uso como ejemplo la hora de actualizacion de la primer moneda

            lblFecha.Text = ListCurrencies[0].fechaActualizacion.ToString("dd/MM/yyyy");

            rptCurrencies.DataSource = ListCurrencies;
            rptCurrencies.DataBind();
        }

        protected void selectorMoneda_SelectedIndexChanged(object sender, EventArgs e)
        {

            selectedCoin = int.Parse(selectorMoneda.SelectedValue);
            DataBind();
            if (selectedCoin > 0)
            {
                lblFecha.Text = ListCurrencies[selectedCoin - 1].fechaActualizacion.ToString("dd/MM/yyyy");
                flagNombre.Text = ListCurrencies[selectedCoin - 1].moneda;
                if (selectedCoin < 8)
                {
                    //si la moneda seleccionada esta entre 1 y 7 pongo el icono de usd
                    flagImg.ImageUrl = "img/usd.svg";
                }
                else
                {
                    //hago un switch
                    switch (selectedCoin)
                    {
                        case 8:
                            flagImg.ImageUrl = "img/eur.svg";
                            break;
                        case 9:
                            flagImg.ImageUrl = "img/brl.svg";
                            break;
                        case 10:
                            flagImg.ImageUrl = "img/clp.svg";
                            break;
                        case 11:
                            flagImg.ImageUrl = "img/uyu.svg";
                            break;
                    }
                }
            }
            else
            {
                flagImg.ImageUrl = "img/noun-world-2699516.svg";
                flagNombre.Text = "Todas";
            }



        }

        protected void btnGuardarFavorito_Click(object sender, EventArgs e)
        {
            if(IdUsuario != 0)
            {
                Button clickedButton = (Button)sender;
                int selectedIndex = int.Parse(clickedButton.CommandArgument);
                Currency selectedCurrency = ListCurrencies[selectedIndex];
                selectedCurrency.bandera = GetFlagImage(selectedCurrency.moneda);
                if (!VerifyExistence(selectedCurrency, IdUsuario))
                {
                    SaveFavorites(selectedCurrency, IdUsuario);
                    // Llama a una función JavaScript después de guardar la moneda
                    string script = "<script>showSuccessAlert();</script>"; // Nombre de tu función JavaScript
                    ClientScript.RegisterStartupScript(this.GetType(), "showSuccessAlert", script);
                }
                else
                {
                    string script = "<script>showErrorAlert();</script>"; // Nombre de tu función JavaScript
                    ClientScript.RegisterStartupScript(this.GetType(), "showErrorAlert", script);
                }
            }
            else
            {
                string script = "<script>userNotLoggedIn();</script>"; // Nombre de tu función JavaScript
                ClientScript.RegisterStartupScript(this.GetType(), "userNotLoggedIn", script);

            }
        }
        private void SaveFavorites(Currency selected, int idUsuario)
        {
            CurrencyData data = new CurrencyData();
            try
            {
                data.SaveCurrency(selected, idUsuario);
            }
            catch (Exception)
            {
                throw;
            }
        }
        private bool VerifyExistence(Currency currency, int idUsuario)
        {
            CurrencyData data = new CurrencyData();
            try
            {
                if (data.VerifyExistence(currency, idUsuario))
                {
                    //ya existe la moneda
                    return true;
                }
                return false;
            }
            catch (Exception)
            {

                throw;
            }
        }
        protected string GetFlagImage(string currencyCode)
        {
            switch (currencyCode)
            {
                case "USD":
                    return "usd.svg";
                case "EUR":
                    return "eur.svg";
                case "BRL":
                    return "brl.svg";
                case "CLP":
                    return "clp.svg";
                case "UYU":
                    return "uyu.svg";
                default:
                    return "";
            }
        }
    }

}
