
using Domain;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;

namespace BullCoin
{
    public class CurrenciesController : ApiController
    {
        private HttpClient client;

        public CurrenciesController()
        {
            client = new HttpClient();
        }
        public async Task<List<Currency>> GetAllCurrencies()
        {
            List<Currency> currenciesList = new List<Currency>();
            List<Currency> dollarsList = new List<Currency>();
            Currency eur = new Currency();
            Currency braReal = new Currency();
            Currency chilean = new Currency();
            Currency uyu = new Currency();



            try
            {
                HttpResponseMessage responseDollars = await client.GetAsync("https://dolarapi.com/v1/dolares");
                if (responseDollars.IsSuccessStatusCode)
                {
                    string responseDollarsJson = await responseDollars.Content.ReadAsStringAsync();
                    dollarsList = JsonConvert.DeserializeObject<List<Currency>>(responseDollarsJson);
                    currenciesList.AddRange(dollarsList);
                }

                HttpResponseMessage responseEur = await client.GetAsync("https://dolarapi.com/v1/cotizaciones/eur");
                if (responseEur.IsSuccessStatusCode)
                {
                    eur = await responseEur.Content.ReadAsAsync<Currency>();
                    currenciesList.Add(eur);
                }

                HttpResponseMessage responseBra = await client.GetAsync("https://dolarapi.com/v1/cotizaciones/brl");
                if (responseBra.IsSuccessStatusCode)
                {
                    braReal = await responseBra.Content.ReadAsAsync<Currency>();
                    currenciesList.Add(braReal);
                }

                HttpResponseMessage responseChi = await client.GetAsync("https://dolarapi.com/v1/cotizaciones/clp");
                if (responseChi.IsSuccessStatusCode)
                {
                    chilean = await responseChi.Content.ReadAsAsync<Currency>();
                    currenciesList.Add(chilean);
                }

                HttpResponseMessage responseUyu = await client.GetAsync("https://dolarapi.com/v1/cotizaciones/uyu");
                if (responseUyu.IsSuccessStatusCode)
                {
                    uyu = await responseUyu.Content.ReadAsAsync<Currency>();
                    currenciesList.Add(uyu);
                }


                return currenciesList;
            }
            catch (Exception)
            {
                throw;
            }

        }
    }
}