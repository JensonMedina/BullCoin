using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data
{
    public class DataAccess
    {
        // declaro una conexión SQL
        private SqlConnection Connection = new SqlConnection();

        // declaro un comando SQL
        private SqlCommand Command = new SqlCommand();

        // Declaro un lector de datos SQL
        private SqlDataReader Reader;

        // Propiedad para obtener el lector de datos SQL
        public SqlDataReader GetReader
        {
            get { return Reader; }
        }

        // Constructor de la clase
        public DataAccess()
        {
            // inicializo la conexión sql con la cadena de conexión de la base de datos
            Connection = new SqlConnection("Server=.\\SQLEXPRESS01; database=BullCoin; integrated security=true");

            // inicializo el comando SQL
            Command = new SqlCommand();
        }

        // metodo para establecer la consulta SQL
        public void SetQuery(string query)
        {
            // establezco el tipo de comando como texto (consulta SQL)
            Command.CommandType = System.Data.CommandType.Text;

            // asigno la consulta SQL al comando
            Command.CommandText = query;
        }

        // metodo para agregar parámetros a la consulta SQL
        public void SetParameters(string name, object value)
        {
            // Agregar un parámetro al comando con el nombre y valor especificados
            Command.Parameters.AddWithValue(name, value);
        }

        public void SetearStoredProcedure(string storedProcedure)
        {
            Command.CommandType = System.Data.CommandType.StoredProcedure;
            Command.CommandText = storedProcedure;
        }

        // metodo para ejecutar una consulta que devuelve datos
        public void ExecuteRead()
        {
            // Asignar la conexión al comando
            Command.Connection = Connection;
            try
            {
                // Abrir la conexión
                Connection.Open();

                // Ejecutar la consulta y obtener el lector de datos
                Reader = Command.ExecuteReader();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        // mettodo para ejecutar una acción que no devuelve datos (INSERT, UPDATE, DELETE)
        public void ExecuteAction()
        {
            Command.Connection = Connection;
            try
            {
                Connection.Open();

                Command.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        // metodo para cerrar la conexión y el lector de datos si está abierto
        public void CloseConnection()
        {
            if (Reader != null)
                // Cerrar el lector de datos
                Reader.Close();

            // Cerrar la conexión
            Connection.Close();
        }
    }

}
