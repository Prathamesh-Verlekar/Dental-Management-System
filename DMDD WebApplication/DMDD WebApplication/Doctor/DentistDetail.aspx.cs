using DMDD_WebApplication.BusinessLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI.WebControls;

namespace DMDD_WebApplication.Doctor
{
    public partial class DentistDetail : System.Web.UI.Page
    {
        List<Dentist> dentistList = new List<Dentist>();



        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindGrid();
            }
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            saveDentist();
        }


        public void saveDentist()
        {
            String firstName = txtfirstname.Text;
            String LastName = txtlastName.Text;
            String DentistType = ddldentistType.SelectedValue;
            String SSN = txtssn.Text;
            String Gender = ddlgender.SelectedValue;
            String Location = ddlLocation.SelectedValue;

            Dentist d = new Dentist();
            d.FirstName1 = firstName;
            d.LastName1 = LastName;
            d.DentistType1 = DentistType;
            d.SSN1 = SSN;
            d.Gender1 = Gender;
            d.Location1 = Location;
            d.MiddleName1 = txtMiddleName.Text;
            d.Workexp1 = Int32.Parse(txtworkexp.Text);
            d.Phone1 = "236718236876";
            d.User_ID = 1;
            d.Dentist_ID1 = Int32.Parse(hfdentistID.Value);

         //   dentistList.Add(d);
            d.insertDentist();

            bindGrid();
        }

        public void bindGrid()
        {

            Dentist d = new Dentist();
            DataSet ds = d.getDentistData();
            gvDentist.DataSource = ds;
            gvDentist.DataBind();


        }

        protected void gvDentist_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmdedit")
            {
                Dentist d = new Dentist();
                d.Dentist_ID1 = Convert.ToInt32(e.CommandArgument);
                d.getDentistDataByID();
                txtfirstname.Text = d.FirstName1;
                txtlastName.Text = d.LastName1;
                txtMiddleName.Text = d.LastName1;
                txtssn.Text = d.SSN1;
                txtworkexp.Text = Convert.ToString(d.Workexp1);
                ddldentistType.SelectedValue = d.DentistType1;
                ddlgender.SelectedValue = d.Gender1;
                hfdentistID.Value = Convert.ToString(d.Dentist_ID1);

            }
            if (e.CommandName == "cmddelete")
            {
                Dentist d = new Dentist();
                d.Dentist_ID1 = Convert.ToInt32(e.CommandArgument);
                d.removeDentist();
                bindGrid();
            }
        }
    }
}