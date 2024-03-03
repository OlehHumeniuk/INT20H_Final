using Microsoft.Data.SqlClient;
using Server_Test_SignalR.Entieis;
using Server_Test_SignalR.Entieis.DeviseTypes;
using System.Data;

namespace Server_Test_SignalR.DataLayer
{
    public class DeviceTypesDL
    {
        public string ConnectionString = "Data Source=DESKTOP-ENJOGM8;Initial Catalog=INT20DB;Integrated Security=True; TrustServerCertificate=True";
        public async Task<List<DeviceTypes>> GetAllDeviceTypesAsync()
        {
            List<DeviceTypes> devices = new List<DeviceTypes>();

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
                                devices.Add(new DeviceTypes
                                {
                                    DeviceTypeID = reader.GetInt64(reader.GetOrdinal("DeviceTypeID")),
                                    DeviceTypeName = reader.GetString(reader.GetOrdinal("DeviceTypeName")),
                                    ImagePath = reader.GetString(reader.GetOrdinal("ImagePath"))
                                });
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

