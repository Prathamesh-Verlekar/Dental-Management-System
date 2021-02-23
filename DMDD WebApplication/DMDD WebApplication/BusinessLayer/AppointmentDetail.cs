using System;
using DMDD_WebApplication.DBConnection;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;


namespace DMDD_WebApplication.BusinessLayer
{
    public class AppointmentDetail
    {
       // Int32 Appointment_id;
        Int32 Dentist_id;
        Int32 Patient_id;
        Int32 Room_id;
        DateTime Appointment_start_time;
        DateTime Appointment_end_time;

        
        Int32 Modified_by;
        

        Int32 Appointment_id = -1;

        public int Appointment_id1 { get => Appointment_id; set => Appointment_id = value; }
        public int Dentist_id1 { get => Dentist_id; set => Dentist_id = value; }
        public int Patient_id1 { get => Patient_id; set => Patient_id = value; }
        public int Room_id1 { get => Room_id; set => Room_id = value; }
        public DateTime Appointment_start_time1 { get => Appointment_start_time; set => Appointment_start_time = value; }
        public DateTime Appointment_end_time1 { get => Appointment_end_time; set => Appointment_end_time = value; }
        
        public int Modified_by1 { get => Modified_by; set => Modified_by = value; }
        
        public int Appointment_id2 { get => Appointment_id; set => Appointment_id = value; }
        public int Dentist_id2 { get => Dentist_id; set => Dentist_id = value; }
        public int Patient_id2 { get => Patient_id; set => Patient_id = value; }
        public int Room_id2 { get => Room_id; set => Room_id = value; }
        public DateTime Appointment_start_time2 { get => Appointment_start_time; set => Appointment_start_time = value; }
        public DateTime Appointment_end_time2 { get => Appointment_end_time; set => Appointment_end_time = value; }
        
        public int Modified_by2 { get => Modified_by; set => Modified_by = value; }
        


        public void insertAppointment()
        {

            DatabaseConnection dc = new DatabaseConnection();
            try
            {
                dc.open();
                dc.addparameter("@Appointment_id", DbType.Int32, 0, Appointment_id, ParameterDirection.Input);
                dc.addparameter("@Dentist_id", DbType.Int32, 0, Dentist_id, ParameterDirection.Input);
                dc.addparameter("@Patient_id", DbType.Int32, 0, Patient_id, ParameterDirection.Input);
                dc.addparameter("@Room_id", DbType.Int32, 0, Room_id, ParameterDirection.Input);
                dc.addparameter("@Appointment_start_time", DbType.DateTime, 0, Appointment_start_time, ParameterDirection.Input);
                dc.addparameter("@Appointment_end_time", DbType.DateTime, 0, Appointment_end_time, ParameterDirection.Input);
                
                dc.addparameter("@Modified_by", DbType.Int32, 0, Modified_by, ParameterDirection.Input);
                


                dc.Executenonquery("InsertAppointment", true);

            }
            catch (Exception e)
            {

            }
            finally
            {
                dc.dispose();
            }
        }



        public DataSet getAppointmentData()
        {
            DatabaseConnection dbm = new DatabaseConnection();
            try
            {
                dbm.open();
                DataSet ds = dbm.Getdataset("getAppointmentData", true);
                return ds;
            }
            finally
            {

                dbm.dispose();
            }
        }


        public void updateAppointment()
        {
            DatabaseConnection dc = new DatabaseConnection();
            try
            {
                dc.open();
                dc.addparameter("@Appointment_id", DbType.Int32, 0, Appointment_id, ParameterDirection.Input);
                dc.addparameter("@Dentist_id", DbType.Int32, 0, Dentist_id, ParameterDirection.Input);
                dc.addparameter("@Patient_id", DbType.Int32, 0, Patient_id, ParameterDirection.Input);
                dc.addparameter("@Room_id", DbType.Int32, 0, Room_id, ParameterDirection.Input);
                dc.addparameter("@Appointment_start_time", DbType.DateTime, 0, Appointment_start_time, ParameterDirection.Input);
                dc.addparameter("@Appointment_end_time", DbType.DateTime, 0, Appointment_end_time, ParameterDirection.Input);
                
                dc.addparameter("@Modified_by", DbType.Int32, 0, Modified_by, ParameterDirection.Input);
                

                dc.Executenonquery("InsertAppointment", true);
            }
            finally
            {
                dc.dispose();
            }
        }

        public void getAppointmentDataByID()
        {
            DatabaseConnection dbm = new DatabaseConnection();
            dbm.open();
            dbm.addparameter("@Appointment_id", DbType.Int32, 0, Appointment_id, ParameterDirection.Input);
            SqlDataReader sdr = dbm.Getdatareader("getAppointmentByAppointmentID", true);
            if (sdr.Read())
            {
                Appointment_id = Convert.ToInt32(sdr["Appointment_id"]);
                Dentist_id = Convert.ToInt32(sdr["Dentist_id"]);
                Patient_id = Convert.ToInt32(sdr["Patient_id"]);
                Room_id = Convert.ToInt32(sdr["Room_id"]);
                Appointment_start_time = Convert.ToDateTime(sdr["Appointment_start_time"]);
                Appointment_end_time = Convert.ToDateTime(sdr["Appointment_end_time"]);
                
                Modified_by = Convert.ToInt32(sdr["Modified_by"]);
                

            }
        }
        public void removeAppointment()
        {
            DatabaseConnection dbm = new DatabaseConnection();
            try
            {


                dbm.open();
                dbm.addparameter("@Appointment_id", DbType.Int32, 0, Appointment_id, ParameterDirection.Input);
                //SqlDataReader sdr = dbm.Getdatareader("removeAppointment", true);
                dbm.Executenonquery("removeAppointment", true);

            }
            finally
            {
                dbm.dispose();
            }

        }



    }
}