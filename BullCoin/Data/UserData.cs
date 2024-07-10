using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Domain;

namespace Data
{
    public class UserData
    {
        public void AddUser(User user)
        {
            DataAccess dataAccess = new DataAccess();
            try
            {
                string query = "insert into usuarios values (@email, @password)";
                dataAccess.SetQuery(query);
                dataAccess.SetParameters("@email", user.Email);
                dataAccess.SetParameters("@password", user.Password);
                dataAccess.ExecuteAction();
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                dataAccess.CloseConnection();
            }
        }
        public int Login(string email, string password)
        {
            DataAccess dataAccess = new DataAccess();
            int id = 0;
            try
            {
                dataAccess.SetearStoredProcedure("login");
                dataAccess.SetParameters("@email", email);
                dataAccess.SetParameters("@password", password);
                dataAccess.ExecuteRead();
                if (dataAccess.GetReader.Read())
                {
                    id = (int)dataAccess.GetReader["id"];
                }

                return id;
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
