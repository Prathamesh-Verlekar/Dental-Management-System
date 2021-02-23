using DMDD_WebApplication.BusinessLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DMDD_WebApplication.Doctor
{
    public partial class DentistDetail : System.Web.UI.Page
    {
        List<Treatment> treatmentList = new List<Treatment>();
    


        protected void Page_Load_Treatment(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindGrid_Treatment();
            }
        }

        protected void btnsave_Click_Treatment(object sender, EventArgs e)
        {
            saveTreatment();
        }


        public void saveTreatment()
        {
            String TreatmentComments = txtTreatmentComment.Text;
            

            Treatment t = new Treatment();
           t.TreatmentComments1 = TreatmentComments;
            
            t.PatientTreatment_ID1 = Int32.Parse(hftreatmentID.Value);

            treatmentList.Add(t);
            t.insertTreatment();

            bindGrid();
        }

        public void bindGrid_Treatment()
        {

            Treatment d = new Treatment();
            DataSet ds = d.getTreatmentData();
            gvTreatment.DataSource = ds;
            gvTreatment.DataBind();


        }

        protected void gvTreatment_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmdedit")
            {
                Treatment d = new Treatment();
                d.PatientTreatment_ID1 = Convert.ToInt32(e.CommandArgument);
                d.getTreatmentDataByID();
                txtTreatmentComment.Text = d.TreatmentComments1;
       
                hftreatmentID.Value = Convert.ToString(d.PatientTreatment_ID1);
                
            }
            if(e.CommandName == "cmddelete")
            {
                Treatment d = new Treatment();
                d.PatientTreatment_ID1 = Convert.ToInt32(e.CommandArgument);
                d.removeTreatment();
                bindGrid();
            }
        }

        protected void hfdentistID_ValueChanged(object sender, EventArgs e)
        {

        }
    }
}