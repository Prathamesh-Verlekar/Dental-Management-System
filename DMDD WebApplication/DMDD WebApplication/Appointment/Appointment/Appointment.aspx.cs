using DMDD_WebApplication.BusinessLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI.WebControls;

namespace DMDD_WebApplication.Appointment
{
    public partial class DentistDetail : System.Web.UI.Page
    {
        List<AppointmentDetail> dentistList = new List<AppointmentDetail>();



        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindGrid();
            }
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            saveAppointment();
        }


        public void saveAppointment()
        {

            Int32 Appointment_id = txtappointmentid.SelectedValue;
            String Dentist_id = txtdentistid.Text;
            String Patient_id = txtpatientid.SelectedValue;
            String Room_id = txtroomid.Text;
            String Appointment_start_time = txtappointmentstarttime.Text;
            String Appointment_end_time = txtappointmentendtime.Text;
            
            String Modified_by = txtmodifiedby.Text;


            AppointmentDetail a = new AppointmentDetail();
            a.Appointment_id = Appointment_id;
            a.Dentist_id1 = Dentist_id;
            a.Patient_id1 = Patient_id;
            a.Room_id1 = Room_id;
            a.Appointment_start_time1 = Appointment_start_time;
            a.Appointment_end_time1 = Appointment_end_time;
            
            a.Modified_by = Modified_by;
            

            //   dentistList.Add(a);
            a.insertAppointment();

            bindGrid();
        }

        public void bindGrid()
        {

            AppointmentDetail a = new AppointmentDetail();
            DataSet ds = a.getAppointmentData();
            gvAppointment.DataSource = ds;
            gvAppointment.DataBind();


        }

        protected void gvAppointment_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmdedit")
            {
                AppointmentDetail a = new AppointmentDetail();
                a.Appointment1 = Convert.ToInt32(e.CommandArgument);
                a.getAppointmentDataByID();
                txtdentistid.Text = Convert.ToString(a.Dentist_id1);
                txtpatientid.Text = Convert.ToString(a.Patient_id1);
                txtroomid.Text = Convert.ToString(a.Room_id1);
                txtappointmentstarttime.Text = a.Appointment_start_time1;
                txtappointmentendtime.Text = a.Appointment_end_time1;
                
                txtmodifiedby.Text = a.Modified_by1;
                

            }
            if (e.CommandName == "cmddelete")
            {
                AppointmentDetail a = new AppointmentDetail();
                a.Appointment1 = Convert.ToInt32(e.CommandArgument);
                a.removeAppointment();
                bindGrid();
            }
        }
    }
}