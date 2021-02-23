using DMDD_WebApplication.BusinessLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI.WebControls;


namespace DMDD_WebApplication.Patient
{
    public partial class PatientDetail : System.Web.UI.Page
    {
        List<Patient1> patientList = new List<Patient1>();



        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindGrid();
            }
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            savePatient();
        }


        public void savePatient()
        {
            String firstName = txtfirstname.Text;
            String LastName = txtlastName.Text;
            String MiddleName = txtMiddleName.Text;
            DateTime DateOfBirth = Convert.ToDateTime(txtDateOfBirth.Text);
            String PatientAddress = txtPatientAddress.Text;
            Int32 City_ID = Convert.ToInt32(txtCity_ID.Text);
            Int32 ZipCode = Convert.ToInt32(txtZipCode.Text);
            String EmergencyContactNumber = txtEmergencyContactNumber.Text;
            String EmergencyContactName = txtEmergencyContactName.Text;

            Patient1 p = new Patient1();
            p.FirstName1 = firstName;
            p.LastName1 = LastName;
            p.MiddleName1 = MiddleName;
            p.Date_Of_Birth1 = DateOfBirth;
            p.Patient_Address1 = PatientAddress;
            p.City_ID1 = City_ID;
            p.Zip_Code1 = ZipCode;
            p.Emergency_Contact_Number1 = EmergencyContactNumber;
            p.Emergency_Contact_Name1 = EmergencyContactName;
            p.User_ID = 1;
            p.Patient_ID1 = Int32.Parse(hfpatientID.Value);

            patientList.Add(p);
            p.insertPatient();

            bindGrid();
        }

        public void bindGrid()
        {

            Patient1 p = new Patient1();
            DataSet ds = p.getPatientData();
            gvPatient.DataSource = ds;
            gvPatient.DataBind();


        }

        protected void gvPatient_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmdedit")
            {
                Patient1 p = new Patient1();
                p.Patient_ID1 = Convert.ToInt32(e.CommandArgument);
                p.getPatientDataByID();
                txtfirstname.Text = p.FirstName1;
                txtlastName.Text = p.LastName1;
                txtMiddleName.Text = p.MiddleName1;
                txtDateOfBirth.Text = Convert.ToString(p.Date_Of_Birth1);
                txtPatientAddress.Text = p.Patient_Address1;
                txtCity_ID.Text = Convert.ToString(p.City_ID1);
                txtZipCode.Text = Convert.ToString(p.Zip_Code1);
                txtEmergencyContactNumber.Text = p.Emergency_Contact_Number1;
                txtEmergencyContactName.Text = p.Emergency_Contact_Name1;
                hfpatientID.Value = Convert.ToString(p.Patient_ID1);

            }
            if (e.CommandName == "cmddelete")
            {
                Patient1 p = new Patient1();
                p.Patient_ID1 = Convert.ToInt32(e.CommandArgument);
                p.removePatient();
                bindGrid();
            }
        }
    }
}