using Microsoft.Data.SqlClient;
using Server_Test_SignalR.Entieis.DeviseTypes;
using System.Data;

namespace Server_Test_SignalR.DataLayer.DeviseTypesDL
{
    public class EntertainmentSystemDL
    {
        public string ConnectionString = "Data Source=DESKTOP-ENJOGM8;Initial Catalog=INT20DB;Integrated Security=True; TrustServerCertificate=True";

        public async Task<EntertainmentSystem> GetEntertainmentSystemDetailsAsync(long deviceId)
        {
            EntertainmentSystem device = null;

            try
            {
                using (SqlConnection conn = new SqlConnection(ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("GetEntertainmentSystemDetails", conn))
                    {
                        conn.Open();
                        cmd.CommandType = CommandType.StoredProcedure;

                        SqlParameter deviceIdParam = new SqlParameter("@DeviceID", SqlDbType.BigInt);
                        deviceIdParam.Value = deviceId;
                        cmd.Parameters.Add(deviceIdParam);

                        using (SqlDataReader reader = await cmd.ExecuteReaderAsync())
                        {
                            if (reader.Read())
                            {
                                device = new EntertainmentSystem
                                {
                                    EntertainmentSystemID = reader.GetInt64(reader.GetOrdinal("EntertainmentSystemsID")),
                                    BrandName = reader.GetString(reader.GetOrdinal("BrandName")),
                                    DeviceModel = reader.GetString(reader.GetOrdinal("DeviceModel")),
                                    DeviceIsSecure = reader.GetString(reader.GetOrdinal("DeviceIsSecure")),
                                    OSVersion = reader.GetString(reader.GetOrdinal("OSVersion")),
                                    OSIsSecure = reader.GetBoolean(reader.GetOrdinal("OSIsSecure")),
                                    KnownVulnerabilities = reader.GetString(reader.GetOrdinal("KnownVulnerabilities")),
                                    ParentalControl = reader.GetString(reader.GetOrdinal("ParentalControl")),
                                    FirmwareIntegrityCheck = reader.GetBoolean(reader.GetOrdinal("FirmwareIntegrityCheck")),
                                    NetworkSecurity = reader.GetString(reader.GetOrdinal("NetworkSecurity")),
                                    ContentEncryption = reader.GetString(reader.GetOrdinal("ContentEncryption")),
                                    DeviceImagePath = reader.GetString(reader.GetOrdinal("DeviceImagePath"))
                                };
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"An error occurred: {ex.Message}");
            }

            return device;
        }

        public async Task<List<EntertainmentSystem>> GetAllEntertainmentSystemsAsync()
        {
            List<EntertainmentSystem> devices = new List<EntertainmentSystem>();

            try
            {
                using (SqlConnection conn = new SqlConnection(ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("GetAllEntertainmentSystemDetails", conn))
                    {
                        conn.Open();
                        cmd.CommandType = CommandType.StoredProcedure;

                        using (SqlDataReader reader = await cmd.ExecuteReaderAsync())
                        {
                            while (reader.Read())
                            {
                                devices.Add(new EntertainmentSystem
                                {
                                    EntertainmentSystemID = reader.GetInt64(reader.GetOrdinal("EntertainmentSystemsID")),
                                    BrandName = reader.GetString(reader.GetOrdinal("BrandName")),
                                    DeviceModel = reader.GetString(reader.GetOrdinal("DeviceModel")),
                                    DeviceIsSecure = reader.GetString(reader.GetOrdinal("DeviceIsSecure")),
                                    OSVersion = reader.GetString(reader.GetOrdinal("OSVersion")),
                                    OSIsSecure = reader.GetBoolean(reader.GetOrdinal("OSIsSecure")),
                                    KnownVulnerabilities = reader.GetString(reader.GetOrdinal("KnownVulnerabilities")),
                                    ParentalControl = reader.GetString(reader.GetOrdinal("ParentalControl")),
                                    FirmwareIntegrityCheck = reader.GetBoolean(reader.GetOrdinal("FirmwareIntegrityCheck")),
                                    NetworkSecurity = reader.GetString(reader.GetOrdinal("NetworkSecurity")),
                                    ContentEncryption = reader.GetString(reader.GetOrdinal("ContentEncryption")),
                                    DeviceImagePath = reader.GetString(reader.GetOrdinal("DeviceImagePath"))
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
