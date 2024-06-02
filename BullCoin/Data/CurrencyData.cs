using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using Domain;
using Newtonsoft.Json;

namespace Data
{
    public class CurrencyData
    {
        //public Currency currencies { get; set; }

        public List<Currency> ListCurrencies()
        {
            DataAccess data = new DataAccess();
            List<Currency> list = new List<Currency>();
            try
            {
                string query = "select * from cotizacionesGuardadas order by fechaActualizacion desc";
                data.SetQuery(query);
                data.ExecuteRead();
                while (data.GetReader.Read())
                {
                    Currency aux = new Currency();
                    aux.id = (int)data.GetReader["id"];
                    aux.moneda = (string)data.GetReader["moneda"];
                    aux.casa = (string)data.GetReader["casa"];
                    aux.nombre = (string)data.GetReader["nombre"];
                    aux.compra = (decimal)data.GetReader["compra"];
                    aux.venta = (decimal)data.GetReader["venta"];
                    aux.fechaActualizacion = (DateTime)data.GetReader["fechaActualizacion"];
                    aux.bandera = (string)data.GetReader["bandera"];
                    list.Add(aux);
                }
                return list;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                data.CloseConnection();
            }
        }

        public void SaveCurrency(Currency newCurrency)
        {
            DataAccess data = new DataAccess();
            try
            {
                data.SetearStoredProcedure("StoredAddCurrency");
                data.SetParameters("@moneda", newCurrency.moneda);
                data.SetParameters("@casa", newCurrency.casa);
                data.SetParameters("@nombre", newCurrency.nombre);
                data.SetParameters("@compra", newCurrency.compra);
                data.SetParameters("@venta", newCurrency.venta);
                data.SetParameters("@fechaActualizacion", newCurrency.fechaActualizacion);
                data.SetParameters("@bandera", newCurrency.bandera);

                data.ExecuteAction();
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                data.CloseConnection();
            }

        }
    }

}