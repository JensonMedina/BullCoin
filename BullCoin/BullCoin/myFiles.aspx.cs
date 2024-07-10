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
            if (Session["idUsuario"] != null)
            {
                int idUsuario = (int)Session["idUsuario"];
                if (!IsPostBack)
                {
                    //si no es postback cargo las cotizaciones guardadas en la base de datos
                    LoadCurrencies(idUsuario);
                }
            }
            else
            {
                //no se ha iniciado sesión.
                string script = "<script>userNotLoggedIn();</script>"; // Nombre de tu función JavaScript
                ClientScript.RegisterStartupScript(this.GetType(), "userNotLoggedIn", script);
            }
            
            
        }

        private void LoadCurrencies(int idUsuario)
        {
            //instancio un objeto de tipo currencydata que voy a usar para acceder al metodo listcurrencies
            CurrencyData currencyData = new CurrencyData();
            try
            {
                //llamo al metodo para traer las cotizaciones guardas y las guardo en la lista de currencies
                Currencies = currencyData.ListCurrencies(idUsuario);
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
            Button btn = (Button)sender;
            HiddenField hnfId = (HiddenField)btn.NamingContainer.FindControl("hnfId");

            if (hnfId != null)
            {
                int id = int.Parse(hnfId.Value);
                CurrencyData data = new CurrencyData();
                try
                {
                    data.DeleteCurrency(id);
                    string script = "<script>cotizacionEliminada();</script>";
                    ClientScript.RegisterStartupScript(this.GetType(), "cotizacionEliminada", script);
                    //LoadCurrencies();
                }
                catch (Exception ex)
                {
                    // Manejar el error
                    throw;
                }
            }
        }

    }
}