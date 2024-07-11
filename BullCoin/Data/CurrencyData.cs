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

        public List<Currency> ListCurrencies(int idUsuario)
        {
            DataAccess data = new DataAccess();
            List<Currency> list = new List<Currency>();
            try
            {
                string query = "select * from cotizacionesGuardadas where idUsuario = @idUsuario order by fechaActualizacion desc";
                data.SetQuery(query);
                data.SetParameters("@idUsuario", idUsuario);
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

        public bool VerifyExistence(Currency currency, int idUsuario)
        {
            DataAccess data = new DataAccess();
            try
            {
                string query = "select * from cotizacionesGuardadas where moneda = @moneda and casa = @casa and fechaActualizacion = @fechaActualizacion and idUsuario = @idUsuario";
                data.SetQuery(query);
                data.SetParameters("@moneda", currency.moneda);
                data.SetParameters("@casa", currency.casa);
                data.SetParameters("@fechaActualizacion", ExtractDateWithoutTime(currency.fechaActualizacion));
                data.SetParameters("@idUsuario", idUsuario);
                data.ExecuteRead();

                if (data.GetReader.Read())
                {
                    return true;
                }
                return false;
            }
            catch (Exception ex)
            {
                // Aquí puedes manejar la excepción de una manera más adecuada
                // como por ejemplo, registrar el error en un log
                throw new Exception("Error al verificar la existencia de la moneda.", ex);
            }
            finally
            {
                // Asegúrate de cerrar y limpiar recursos en el bloque finally
                data.CloseConnection();
            }
        }
        private DateTime ExtractDateWithoutTime(DateTime dateIso)
        {

            // Obtener solo la parte de la fecha
            string dateOnly = dateIso.ToString("yyyy-MM-dd"); // Formato deseado para la fecha
            

            return DateTime.Parse(dateOnly).Date;
        }
        public void SaveCurrency(Currency newCurrency, int idUsuario)
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
                data.SetParameters("@fechaActualizacion", ExtractDateWithoutTime(newCurrency.fechaActualizacion));
                data.SetParameters("@bandera", newCurrency.bandera);
                data.SetParameters("@idUsuario", idUsuario);
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

        public void DeleteCurrency(int Id, int idUsuario)
        {
            DataAccess data = new DataAccess();
            try
            {
                string query = "delete from cotizacionesGuardadas where id = @id and idUsuario = @idUsuario";
                data.SetQuery(query);
                data.SetParameters("@id", Id);
                data.SetParameters("@idUsuario", idUsuario);
                data.ExecuteAction();

            }
            catch (Exception ex)
            {
                throw new Exception("Error en el metodo eliminar cotizacion: " + ex.Message);
            }
            finally
            {
                data.CloseConnection();
            }
        }
    }

}