using Microsoft.Data.SqlClient;
using Server_Test_SignalR.Entieis.DeviseTypes;
using System.Data;

namespace Server_Test_SignalR.DataLayer.DeviseTypesDL
{
    public class OfficeEquipmentDL
    {
        public string ConnectionString = "Data Source=DESKTOP-ENJOGM8;Initial Catalog=INT20DB;Integrated Security=True; TrustServerCertificate=True";

        public async Task<OfficeEquipment> GetOfficeEquipmentDetailsAsync(long deviceId)
        {
            OfficeEquipment device = null;

            try
            {
                using (SqlConnection conn = new SqlConnection(ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("GetOfficeEquipmentDetails", conn))
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
                                device = new OfficeEquipment
                                {
                                    OfficeEquipmentID = reader.GetInt64(reader.GetOrdinal("OfficeEquipmentID")),
                                    BrandName = reader.GetString(reader.GetOrdinal("BrandName")),
                                    DeviceModel = reader.GetString(reader.GetOrdinal("DeviceModel")),
                                    DeviceIsSecure = reader.GetString(reader.GetOrdinal("DeviceIsSecure")),
                                    OSVersion = reader.GetString(reader.GetOrdinal("OSVersion")),
                                    OSIsSecure = reader.GetBoolean(reader.GetOrdinal("OSIsSecure")),
                                    KnownVulnerabilities = reader.GetString(reader.GetOrdinal("KnownVulnerabilities")),
                                    NetworkConnectivity = reader.GetString(reader.GetOrdinal("NetworkConnectivity")),
                                    DocumentSecurityFeatures = reader.GetString(reader.GetOrdinal("DocumentSecurityFeatures")),
                                    UserAuthentication = reader.GetString(reader.GetOrdinal("UserAuthentication")),
                                    AccessLogs = reader.GetString(reader.GetOrdinal("AccessLogs")),
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

        public async Task<List<OfficeEquipment>> GetAllOfficeEquipmentAsync()
        {
            List<OfficeEquipment> devices = new List<OfficeEquipment>();

            try
            {
                using (SqlConnection conn = new SqlConnection(ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("GetAllOfficeEquipmentDetails", conn))
                    {
                        conn.Open();
                        cmd.CommandType = CommandType.StoredProcedure;

                        using (SqlDataReader reader = await cmd.ExecuteReaderAsync())
                        {
                            while (reader.Read())
                            {
                                devices.Add(new OfficeEquipment
                                {
                                    OfficeEquipmentID = reader.GetInt64(reader.GetOrdinal("OfficeEquipmentID")),
                                    BrandName = reader.GetString(reader.GetOrdinal("BrandName")),
                                    DeviceModel = reader.GetString(reader.GetOrdinal("DeviceModel")),
                                    DeviceIsSecure = reader.GetString(reader.GetOrdinal("DeviceIsSecure")),
                                    OSVersion = reader.GetString(reader.GetOrdinal("OSVersion")),
                                    OSIsSecure = reader.GetBoolean(reader.GetOrdinal("OSIsSecure")),
                                    KnownVulnerabilities = reader.GetString(reader.GetOrdinal("KnownVulnerabilities")),
                                    NetworkConnectivity = reader.GetString(reader.GetOrdinal("NetworkConnectivity")),
                                    DocumentSecurityFeatures = reader.GetString(reader.GetOrdinal("DocumentSecurityFeatures")),
                                    UserAuthentication = reader.GetString(reader.GetOrdinal("UserAuthentication")),
                                    AccessLogs = reader.GetString(reader.GetOrdinal("AccessLogs")),
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
