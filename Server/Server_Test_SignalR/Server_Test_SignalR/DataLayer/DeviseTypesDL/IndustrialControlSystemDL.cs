using Microsoft.Data.SqlClient;
using Server_Test_SignalR.Entieis.DeviseTypes;
using System.Data;

namespace Server_Test_SignalR.DataLayer.DeviseTypesDL
{
    public class IndustrialControlSystemDL
    {
        public string ConnectionString = "Data Source=DESKTOP-ENJOGM8;Initial Catalog=INT20DB;Integrated Security=True; TrustServerCertificate=True";

        public async Task<IndustrialControlSystem> GetIndustrialControlSystemDetailsAsync(long deviceId)
        {
            IndustrialControlSystem device = null;

            try
            {
                using (SqlConnection conn = new SqlConnection(ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("GetIndustrialControlSystemDetails", conn))
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
                                device = new IndustrialControlSystem
                                {
                                    IndustrialControlSystemID = reader.GetInt64(reader.GetOrdinal("IndustrialControlSystemID")),
                                    BrandName = reader.GetString(reader.GetOrdinal("BrandName")),
                                    DeviceModel = reader.GetString(reader.GetOrdinal("DeviceModel")),
                                    DeviceIsSecure = reader.GetString(reader.GetOrdinal("DeviceIsSecure")),
                                    OSVersion = reader.GetString(reader.GetOrdinal("OSVersion")),
                                    OSIsSecure = reader.GetBoolean(reader.GetOrdinal("OSIsSecure")),
                                    KnownVulnerabilities = reader.GetString(reader.GetOrdinal("KnownVulnerabilities")),
                                    SCADASecurity = reader.GetString(reader.GetOrdinal("SCADASecurity")),
                                    PhysicalSafetyFeatures = reader.GetString(reader.GetOrdinal("PhysicalSafetyFeatures")),
                                    NetworkIsolation = reader.GetBoolean(reader.GetOrdinal("NetworkIsolation")),
                                    RegularUpdatesSupport = reader.GetBoolean(reader.GetOrdinal("RegularUpdatesSupport")),
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

        public async Task<List<IndustrialControlSystem>> GetAllIndustrialControlSystemsAsync()
        {
            List<IndustrialControlSystem> devices = new List<IndustrialControlSystem>();

            try
            {
                using (SqlConnection conn = new SqlConnection(ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("GetAllIndustrialControlSystemDetails", conn))
                    {
                        conn.Open();
                        cmd.CommandType = CommandType.StoredProcedure;

                        using (SqlDataReader reader = await cmd.ExecuteReaderAsync())
                        {
                            while (reader.Read())
                            {
                                devices.Add(new IndustrialControlSystem
                                {
                                    IndustrialControlSystemID = reader.GetInt64(reader.GetOrdinal("IndustrialControlSystemID")),
                                    BrandName = reader.GetString(reader.GetOrdinal("BrandName")),
                                    DeviceModel = reader.GetString(reader.GetOrdinal("DeviceModel")),
                                    DeviceIsSecure = reader.GetString(reader.GetOrdinal("DeviceIsSecure")),
                                    OSVersion = reader.GetString(reader.GetOrdinal("OSVersion")),
                                    OSIsSecure = reader.GetBoolean(reader.GetOrdinal("OSIsSecure")),
                                    KnownVulnerabilities = reader.GetString(reader.GetOrdinal("KnownVulnerabilities")),
                                    SCADASecurity = reader.GetString(reader.GetOrdinal("SCADASecurity")),
                                    PhysicalSafetyFeatures = reader.GetString(reader.GetOrdinal("PhysicalSafetyFeatures")),
                                    NetworkIsolation = reader.GetBoolean(reader.GetOrdinal("NetworkIsolation")),
                                    RegularUpdatesSupport = reader.GetBoolean(reader.GetOrdinal("RegularUpdatesSupport")),
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
