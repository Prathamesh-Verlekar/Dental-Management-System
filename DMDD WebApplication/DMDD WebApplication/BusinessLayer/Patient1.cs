using DMDD_WebApplication.DBConnection;
using System;
using System.Data;
using System.Data.SqlClient;

namespace DMDD_WebApplication.BusinessLayer
{
    public class Patient1
    {
        String FirstName;
        String LastName;
        String MiddleName;
        DateTime DateOfBirth;
        String PatientAddress;
        Int32 City_ID;
        Int32 ZipCode;
        String EmergencyContactNumber;
        String EmergencyContactName;
        Int32 user_ID;
        Int32 Patient_ID = -1;

        public string FirstName1 { get => FirstName; set => FirstName = value; }
        public string LastName1 { get => LastName; set => LastName = value; }
        public string MiddleName1 { get => MiddleName; set => MiddleName = value; }
        public DateTime Date_Of_Birth1 { get => DateOfBirth; set => DateOfBirth = value; }
        public string Patient_Address1 { get => PatientAddress; set => PatientAddress = value; }
        public int City_ID1 { get => City_ID; set => City_ID = value; }
        public int Zip_Code1 { get => ZipCode; set => ZipCode = value; }
        public string Emergency_Contact_Number1 { get => EmergencyContactNumber; set => EmergencyContactNumber = value; }
        public string Emergency_Contact_Name1 { get => EmergencyContactName; set => EmergencyContactName = value; }
        public int User_ID { get => user_ID; set => user_ID = value; }
        public int Patient_ID1 { get => Patient_ID; set => Patient_ID = value; }

        public void insertPatient()
        {

            DatabaseConnection dc = new DatabaseConnection();
            try
            {
                dc.open();
                dc.addparameter("@Patient_id", DbType.Int32, 0, Patient_ID, ParameterDirection.Input);
                dc.addparameter("@First_Name", DbType.String, 50, FirstName, ParameterDirection.Input);
                dc.addparameter("@Last_Name", DbType.String, 50, LastName, ParameterDirection.Input);
                dc.addparameter("@Middle_Name", DbType.String, 50, MiddleName, ParameterDirection.Input);
                dc.addparameter("@Date_Of_Birth", DbType.DateTime, 20, DateOfBirth, ParameterDirection.Input);
                dc.addparameter("@Patient_Address", DbType.String, 50, PatientAddress, ParameterDirection.Input);
                dc.addparameter("@City_Id", DbType.Int32, 10, City_ID, ParameterDirection.Input);
                dc.addparameter("@Zip_Code", DbType.Int32, 5, ZipCode, ParameterDirection.Input);
                dc.addparameter("Emergency_Contact_Number", DbType.String, 15, EmergencyContactNumber, ParameterDirection.Input);
                dc.addparameter("Emergency_Contact_Name", DbType.String, 15, EmergencyContactName, ParameterDirection.Input);
                dc.addparameter("@User_ID", DbType.Int32, 0, User_ID, ParameterDirection.Input);
                dc.Executenonquery("insertPatient", true);

            }
            catch (Exception e)
            {

            }
            finally
            {
                dc.dispose();
            }
        }



        public DataSet getPatientData()
        {
            DatabaseConnection dbm = new DatabaseConnection();
            try
            {
                dbm.open();
                DataSet ds = dbm.Getdataset("getPatientData", true);
                return ds;
            }
            finally
            {

                dbm.dispose();
            }
        }


        public void updatePatient()
        {
            DatabaseConnection dc = new DatabaseConnection();
            try
            {
                dc.open();
                dc.addparameter("@Patient_id", DbType.Int32, 0, Patient_ID, ParameterDirection.Input);
                dc.addparameter("@First_Name", DbType.String, 50, FirstName, ParameterDirection.Input);
                dc.addparameter("@Last_Name", DbType.String, 50, LastName, ParameterDirection.Input);
                dc.addparameter("@Middle_Name", DbType.String, 50, MiddleName, ParameterDirection.Input);
                dc.addparameter("@Date_Of_Birth", DbType.DateTime, 20, DateOfBirth, ParameterDirection.Input);
                dc.addparameter("@Patient_Address", DbType.String, 50, PatientAddress, ParameterDirection.Input);
                dc.addparameter("@City_Id", DbType.Int32, 10, City_ID, ParameterDirection.Input);
                dc.addparameter("@Zip_Code", DbType.Int32, 5, ZipCode, ParameterDirection.Input);
                dc.addparameter("Emergency_Contact_Number", DbType.String, 15, EmergencyContactNumber, ParameterDirection.Input);
                dc.addparameter("Emergency_Contact_Name", DbType.String, 15, EmergencyContactName, ParameterDirection.Input);
                dc.addparameter("@User_ID", DbType.Int32, 0, User_ID, ParameterDirection.Input);
                dc.Executenonquery("insertPatient", true);
            }
            finally
            {
                dc.dispose();
            }
        }

        public void getPatientDataByID()
        {
            DatabaseConnection dbm = new DatabaseConnection();
            dbm.open();
            dbm.addparameter("@Patient_ID", DbType.Int32, 0, Patient_ID, ParameterDirection.Input);
            SqlDataReader sdr = dbm.Getdatareader("getPatientByPatientID", true);
            if (sdr.Read())
            {
                Patient_ID = Convert.ToInt32(sdr["Patient_id"]);
                FirstName = Convert.ToString(sdr["First_Name"]);
                LastName = Convert.ToString(sdr["Last_Name"]);
                MiddleName = Convert.ToString(sdr["Middle_Name"]);
                DateOfBirth = Convert.ToDateTime(sdr["Date_Of_Birth"]);
                PatientAddress = Convert.ToString(sdr["Patient_Address"]);
                City_ID = Convert.ToInt32(sdr["City_id"]);
                ZipCode = Convert.ToInt32(sdr["Zip_Code"]);
                EmergencyContactNumber = Convert.ToString(sdr["Emergency_Contact_NUmber"]);
                EmergencyContactName = Convert.ToString(sdr["Emergency_Contact_Name"]);
                User_ID = Convert.ToInt32(sdr["User_ID"]);
            }
        }
        public void removePatient()
        {
            DatabaseConnection dbm = new DatabaseConnection();
            try
            {


                dbm.open();
                dbm.addparameter("@Patient_ID", DbType.Int32, 0, Patient_ID, ParameterDirection.Input);
                //SqlDataReader sdr = dbm.Getdatareader("removeDentist", true);
                dbm.Executenonquery("removePatient", true);

            }
            finally
            {
                dbm.dispose();
            }

        }



    }
}