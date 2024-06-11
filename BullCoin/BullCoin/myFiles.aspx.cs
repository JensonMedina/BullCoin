using Data;
using Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
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
                var groupedData = Currencies
                .GroupBy(c => c.fechaActualizacion.Date)
                .Select(g => new
                {
                    Fecha = g.Key,
                    Currencies = g.ToList()
                })
                .ToList();
                rptFechas.DataSource = groupedData;
                rptFechas.DataBind();
            }
            catch (Exception)
            {

                throw;
            }
        }

       

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            // encuentro el botón que desencadenó el evento
            Button btn = (Button)sender;

            // encuentro el control HiddenField dentro del contenedor del botón
            HiddenField hnfId = (HiddenField)btn.FindControl("hnfId");

            // accedo al valor del HiddenField
            if (hnfId != null)
            {
                int id = int.Parse(hnfId.Value);
                CurrencyData data = new CurrencyData();
                try
                {
                    data.DeleteCurrency(id);
                    LoadCurrencies();
                }
                catch (Exception)
                {
                    throw;
                }
            }

        }
    }
}