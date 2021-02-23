using System;
using DMDD_WebApplication.DBConnection;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace DMDD_WebApplication.BusinessLayer
{
    public class Treatment
    {
        
        String TreatmentComments;
        static Int32 AppointmentDetail_ID;
        Int32 PatientTreatment_ID=-1;

        public string TreatmentComments1 { get => TreatmentComments; set => TreatmentComments = value; }
        public int AppointmentDetail_ID1 { get => AppointmentDetail_ID; set => AppointmentDetail_ID = value; }
        public int PatientTreatment_ID1 { get => PatientTreatment_ID; set => PatientTreatment_ID = value; }

        public void insertTreatment()
        {

            DatabaseConnection dc = new DatabaseConnection();
            try
            {
                dc.open();
                dc.addparameter("@PatientTreatment_ID", DbType.Int32, 0, PatientTreatment_ID, ParameterDirection.Input);
                dc.addparameter("@AppointmentDetail_ID", DbType.Int32, 0, AppointmentDetail_ID, ParameterDirection.Input);
                dc.addparameter("@TreatmentComments", DbType.String, 500, TreatmentComments, ParameterDirection.Input);
                


                dc.Executenonquery("InsertTreatment", true);
                
            }
            catch (Exception e)
            {
                
            }
            finally
            {
                dc.dispose();
            }
        }



        public DataSet getTreatmentData()
        {
            DatabaseConnection dbm = new DatabaseConnection();
            try
            {
                dbm.open();
                DataSet ds = dbm.Getdataset("getTreatmentData", true);
                return ds;
            }
            finally
            {

                dbm.dispose();
            }
        }


        public void updateTreatment()
        {
            DatabaseConnection dc = new DatabaseConnection();
            try
            {
                dc.open();
                dc.addparameter("@PatientTreatment_ID", DbType.Int32, 0, PatientTreatment_ID, ParameterDirection.Input);
                dc.addparameter("@AppointmentDetail_ID", DbType.Int32, 0, AppointmentDetail_ID, ParameterDirection.Input);
                dc.addparameter("@TreatmentComments", DbType.String, 500, TreatmentComments, ParameterDirection.Input);

                dc.Executenonquery("InsertTreatment", true);
            }
            finally
            {
                dc.dispose();
            }
        }

        public void getTreatmentDataByID()
        {
            DatabaseConnection dbm = new DatabaseConnection();
            dbm.open();
            dbm.addparameter("@PatientTreatment_ID", DbType.Int32, 0, PatientTreatment_ID, ParameterDirection.Input);
            SqlDataReader sdr = dbm.Getdatareader("getTreatmentDataByID", true);
            if (sdr.Read())
            {
                PatientTreatment_ID = Convert.ToInt32(sdr["PatientTreatment_ID"]);
                AppointmentDetail_ID = Convert.ToInt32(sdr["AppointmentDetail_ID"]);
                TreatmentComments = Convert.ToString(sdr["TreatmentComments"]);
            

            }
        }
        public void removeTreatment()
        {
            DatabaseConnection dbm = new DatabaseConnection();
            try
            {


                dbm.open();
                dbm.addparameter("@PatientTreatment_ID", DbType.Int32, 0, PatientTreatment_ID, ParameterDirection.Input);
                //SqlDataReader sdr = dbm.Getdatareader("removeDentist", true);
                dbm.Executenonquery("removeTreatment", true);

            }
            finally {
                dbm.dispose();
            }

        }



    }
}