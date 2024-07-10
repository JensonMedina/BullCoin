using Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BullCoin
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            if (!ValidateForm())
                return;
            UserData userData = new UserData();
            int id;
            try
            {
                id = userData.Login(email.Text, password.Text);
                if(id != 0)
                {
                    Session.Add("idUsuario", id);
                    Response.Redirect("default.aspx", false);
                }
            }
            catch (Exception)
            {
                throw;
            }
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
    }
}