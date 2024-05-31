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
        }

        protected void selectorMoneda_SelectedIndexChanged(object sender, EventArgs e)
        {

            selectedCoin = int.Parse(selectorMoneda.SelectedValue);
            DataBind();


        }
    }

}
