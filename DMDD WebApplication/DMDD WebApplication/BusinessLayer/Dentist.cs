
﻿using System;
using DMDD_WebApplication.DBConnection;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;


namespace DMDD_WebApplication.BusinessLayer
{
    public class Dentist
    {
        String FirstName;
        String LastName;
        String SSN;
        String DentistType;
        String Gender;
        String Location;
        String MiddleName;
        String Phone;
        Int32 Workexp;
        Int32 user_ID;

        Int32 Dentist_ID = -1;

        public string FirstName1 { get => FirstName; set => FirstName = value; }
        public string LastName1 { get => LastName; set => LastName = value; }
        public string SSN1 { get => SSN; set => SSN = value; }
        public string DentistType1 { get => DentistType; set => DentistType = value; }
        public string Gender1 { get => Gender; set => Gender = value; }
        public string Location1 { get => Location; set => Location = value; }
        public int Dentist_ID1 { get => Dentist_ID; set => Dentist_ID = value; }
        public string MiddleName1 { get => MiddleName; set => MiddleName = value; }
        public string Phone1 { get => Phone; set => Phone = value; }
        public int Workexp1 { get => Workexp; set => Workexp = value; }
        public int User_ID { get => user_ID; set => user_ID = value; }
        public string FirstName2 { get => FirstName; set => FirstName = value; }
        public string LastName2 { get => LastName; set => LastName = value; }
        public string SSN2 { get => SSN; set => SSN = value; }
        public string DentistType2 { get => DentistType; set => DentistType = value; }
        public string Gender2 { get => Gender; set => Gender = value; }
        public string Location2 { get => Location; set => Location = value; }
        public string MiddleName2 { get => MiddleName; set => MiddleName = value; }
        public string Phone2 { get => Phone; set => Phone = value; }
        public int Workexp2 { get => Workexp; set => Workexp = value; }
        public int User_ID1 { get => user_ID; set => user_ID = value; }
        public int Dentist_ID2 { get => Dentist_ID; set => Dentist_ID = value; }
        

        public void insertDentist()
        {

            DatabaseConnection dc = new DatabaseConnection();
            try
            {
                dc.open();
                dc.addparameter("@Dentist_id", DbType.Int32, 0, Dentist_ID, ParameterDirection.Input);
                dc.addparameter("@First_Name", DbType.String, 50, FirstName, ParameterDirection.Input);
                dc.addparameter("@Last_Name", DbType.String, 50, LastName, ParameterDirection.Input);
                dc.addparameter("@Middle_Name", DbType.String, 50, MiddleName, ParameterDirection.Input);
                dc.addparameter("@SSN", DbType.String, 10, SSN, ParameterDirection.Input);
                dc.addparameter("@Gender", DbType.String, 100, Gender, ParameterDirection.Input);
                dc.addparameter("@Phone", DbType.String, 100, Phone1, ParameterDirection.Input);
                dc.addparameter("@Dentist_Type_ID", DbType.String, 100, DentistType, ParameterDirection.Input);
                dc.addparameter("@WorkExp", DbType.Int32, 0, Workexp1, ParameterDirection.Input);
                dc.addparameter("@User_ID", DbType.Int32, 0, User_ID, ParameterDirection.Input);


                dc.Executenonquery("InsertDentist", true);

            }
            catch (Exception e)
            {

            }
            finally
            {
                dc.dispose();
            }
        }



        public DataSet getDentistData()
        {
            DatabaseConnection dbm = new DatabaseConnection();
            try
            {
                dbm.open();
                DataSet ds = dbm.Getdataset("getDentistData", true);
                return ds;
            }
            finally
            {

                dbm.dispose();
            }
        }


        public void updateDentist()
        {
            DatabaseConnection dc = new DatabaseConnection();
            try
            {
                dc.open();
                dc.addparameter("@Dentist_id", DbType.Int32, 0, Dentist_ID, ParameterDirection.Input);
                dc.addparameter("@First_Name", DbType.String, 50, FirstName, ParameterDirection.Input);
                dc.addparameter("@Last_Name", DbType.String, 50, LastName, ParameterDirection.Input);
                dc.addparameter("@Middle_Name", DbType.String, 50, MiddleName, ParameterDirection.Input);
                dc.addparameter("@SSN", DbType.String, 10, SSN, ParameterDirection.Input);
                dc.addparameter("@Gender", DbType.String, 100, Gender, ParameterDirection.Input);
                dc.addparameter("@Phone", DbType.String, 100, Phone1, ParameterDirection.Input);
                dc.addparameter("@Dentist_Type_ID", DbType.String, 100, DentistType, ParameterDirection.Input);
                dc.addparameter("@WorkExp", DbType.Int32, 0, Workexp1, ParameterDirection.Input);
                dc.addparameter("@User_ID", DbType.Int32, 0, User_ID, ParameterDirection.Input);

                dc.Executenonquery("InsertDentist", true);
            }
            finally
            {
                dc.dispose();
            }
        }

        public void getDentistDataByID()
        {
            DatabaseConnection dbm = new DatabaseConnection();
            dbm.open();
            dbm.addparameter("@Dentist_ID", DbType.Int32, 0, Dentist_ID, ParameterDirection.Input);
            SqlDataReader sdr = dbm.Getdatareader("getDentistByDentistID", true);
            if (sdr.Read())
            {
                Dentist_ID = Convert.ToInt32(sdr["Dentist_id"]);
                FirstName = Convert.ToString(sdr["First_Name"]);
                LastName = Convert.ToString(sdr["Last_Name"]);
                MiddleName = Convert.ToString(sdr["Middle_Name"]);
                SSN = Convert.ToString(sdr["SSN"]);
                Gender = Convert.ToString(sdr["Gender"]);
                Phone = Convert.ToString(sdr["Phone"]);
                Workexp = Convert.ToInt32(sdr["WorkExp"]);
                User_ID = Convert.ToInt32(sdr["User_ID"]);
                //LocationID = Convert.ToInt32(sdr["LocationIDFK"]);

            }
        }
        public void removeDentist()
        {
            DatabaseConnection dbm = new DatabaseConnection();
            try
            {


                dbm.open();
                dbm.addparameter("@Dentist_ID", DbType.Int32, 0, Dentist_ID, ParameterDirection.Input);
                //SqlDataReader sdr = dbm.Getdatareader("removeDentist", true);
                dbm.Executenonquery("removeDentist", true);

            }
            finally
            {
                dbm.dispose();
            }

        }



    }
}