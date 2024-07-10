using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Data;
using Domain;

namespace BullCoin
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private bool ValidateForm()
        {
            if (string.IsNullOrEmpty(email.Text) || string.IsNullOrEmpty(password.Text))
            {
                lblMsg.Text = "Debes completar todos los campos.";
                return false;
            }
            return true;

        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            if (!ValidateForm())
                return;
            UserData userData = new UserData();
            try
            {
                User user = new User();
                user.Email = email.Text;
                user.Password = password.Text;
                userData.AddUser(user);
                string script = "<script>successfullyRegistered();</script>";
                ClientScript.RegisterStartupScript(this.GetType(), "successfullyRegistered", script);
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}