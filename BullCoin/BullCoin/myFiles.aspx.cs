using Data;
using Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BullCoin
{
    public partial class myFiles : System.Web.UI.Page
    {
        //private List<Currency> currencies;
        public List<Currency> Currencies { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //si no es postback cargo las cotizaciones guardadas en la base de datos
                LoadCurrencies();
            }
        }

        private void LoadCurrencies()
        {
            //instancio un objeto de tipo currencydata que voy a usar para acceder al metodo listcurrencies
            CurrencyData currencyData = new CurrencyData();
            try
            {
                //llamo al metodo para traer las cotizaciones guardas y las guardo en la lista de currencies
                Currencies = currencyData.ListCurrencies();
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}