using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Web.UI;
using Domain;
using Data;

namespace BullCoin
{
    public partial class _default : System.Web.UI.Page
    {
        public List<Currency> ListCurrencies { get; set; }
        public int selectedCoin { get; set; }
        private CurrenciesController currenciesController;
        protected void Page_Load(object sender, EventArgs e)
        {
            currenciesController = new CurrenciesController();
            if (!IsPostBack)
            {
                GetCurrencies();
                flagImg.ImageUrl = "img/noun-world.svg";
            }
            else
            {
                // En caso de postback, aseguramos que la lista no es nula
                if (ListCurrencies == null)
                {
                    GetCurrencies();
                }
            }

        }
        private async void GetCurrencies()
        {
            ListCurrencies = await currenciesController.GetAllCurrencies();
            //despues de cargar la lista aprovecho para cargar la hora, para eso uso como ejemplo la hora de actualizacion de la primer moneda
            
            lblFecha.Text = DateTime.Parse(ListCurrencies[0].fechaActualizacion).ToString("dd/MM/yyyy");
        }

        protected void selectorMoneda_SelectedIndexChanged(object sender, EventArgs e)
        {

            selectedCoin = int.Parse(selectorMoneda.SelectedValue);
            DataBind();
            if(selectedCoin > 0)
            {
                lblFecha.Text = DateTime.Parse(ListCurrencies[selectedCoin - 1].fechaActualizacion).ToString("dd/MM/yyyy");
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
                flagImg.ImageUrl = "img/noun-world.svg";
                flagNombre.Text = "Todas";
            }
            
            
           
        }

        protected void btnGuardarFavorito_Click(object sender, EventArgs e)
        {

        }
    }

}
