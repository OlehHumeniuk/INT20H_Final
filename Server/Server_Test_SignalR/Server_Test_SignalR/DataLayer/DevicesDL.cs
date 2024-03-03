using Microsoft.Data.SqlClient;
using Newtonsoft.Json;
using Server_Test_SignalR.Entieis;
using System;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;

namespace Server_Test_SignalR.DataLayer
{
    public class DevicesDL
    {
        public string ConnectionString = "Data Source=DESKTOP-ENJOGM8;Initial Catalog=INT20DB;Integrated Security=True; TrustServerCertificate=True";

        public async Task<List<Device>> GetAllDevicesAsync()
        {
            List<Device> devices = new List<Device>();

            try
            {
                using (SqlConnection conn = new SqlConnection(ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("GetAllDeviceTypes", conn))
                    {
                        conn.Open();
                        cmd.CommandType = CommandType.StoredProcedure;

                        using (SqlDataReader reader = await cmd.ExecuteReaderAsync())
                        {
                            while (reader.Read())
                            {

                                // Отримуємо рядок SignalTypes з reader
                                string signalTypesString = reader.GetString(reader.GetOrdinal("SignalTypes"));

                                // Розділяємо рядок на окремі значення за допомогою коми
                                string[] signalTypesArray = signalTypesString.Split(',');

                                // Перетворюємо масив рядків на список
                                List<string> signalTypesList = signalTypesArray.ToList();

                                Device device = new Device
                                {
                                    DeviceID = reader.GetInt64(reader.GetOrdinal("DeviceID")),
                                    OSID = reader.GetInt64(reader.GetOrdinal("OSID")),
                                    BrandName = reader.GetString(reader.GetOrdinal("BrandName")),
                                    DeviceIsSecure = reader.GetString(reader.GetOrdinal("DeviceIsSecure")),
                                    OSVersion = reader.GetString(reader.GetOrdinal("OSVersion")),
                                    OSIsSecure = reader.GetBoolean(reader.GetOrdinal("OSIsSecure")),
                                    KnownVulnerabilities = reader.GetString(reader.GetOrdinal("KnownVulnerabilities")),
                                    DeviceModel = reader.GetString(reader.GetOrdinal("DeviceModel")),
                                    DeviceImagePath = reader.GetString(reader.GetOrdinal("DeviceImagePath")),
                                    SignalTypes = signalTypesList  // Додаємо список типів сигналів
                                };


                                devices.Add(device);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"An error occurred: {ex.Message}");
            }

            return devices;
        }
    }
}
