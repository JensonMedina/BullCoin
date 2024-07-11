using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
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
            if (Session["idUsuario"] != null)
            {
                Response.Redirect("default.aspx", false);
            }
        }

        private bool ValidateForm()
        {
            UserData userData = new UserData();
            try
            {
                if (string.IsNullOrEmpty(email.Text) || string.IsNullOrEmpty(password.Text))
                {
                    lblMsg.Text = "Debes completar todos los campos.";
                    return false;
                }
                if(userData.Login(email.Text, password.Text) != 0)
                {
                    lblMsg.Text = "Ya existe una cuenta registrada con este correo.";
                    return false;
                }
                if(password.Text != confirmarPassword.Text)
                {
                    lblMsg.Text = "No coincide la contraseña.";
                    return false;
                }
                if (!IsValidEmail(email.Text))
                {
                    lblMsg.Text = ("El email no es válido.");
                    return false;
                }
                if(password.Text.Length < 6) {
                    lblMsg.Text = ("Contraseña demasiado corta.");
                    return false;
                }
                return true;
            }
            catch (Exception)
            {

                throw;
            }
            

        }
        static bool IsValidEmail(string email)
        {
            string pattern = @"^[^@\s]+@[^@\s]+\.[^@\s]+$";
            return Regex.IsMatch(email, pattern);
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

        protected void btnClose_Click(object sender, EventArgs e)
        {
            Response.Redirect("default.aspx", false);
        }
    }
}