using Microsoft.Data.SqlClient;
using Server_Test_SignalR.Entieis.DeviseTypes;
using System.Data;

namespace Server_Test_SignalR.DataLayer.DeviseTypesDL
{
    public class EducationalDeviceDL
    {
        public string ConnectionString = "Data Source=DESKTOP-ENJOGM8;Initial Catalog=INT20DB;Integrated Security=True; TrustServerCertificate=True";

        public async Task<EducationalDevice> GetEducationalDeviceDetailsAsync(long deviceId)
        {
            EducationalDevice device = null;

            try
            {
                using (SqlConnection conn = new SqlConnection(ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("GetEducationalDeviceDetails", conn))
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
                                device = new EducationalDevice
                                {
                                    EducationalDeviceID = reader.GetInt64(reader.GetOrdinal("EducationalDeviceID")),
                                    BrandName = reader.GetString(reader.GetOrdinal("BrandName")),
                                    DeviceModel = reader.GetString(reader.GetOrdinal("DeviceModel")),
                                    DeviceIsSecure = reader.GetString(reader.GetOrdinal("DeviceIsSecure")),
                                    OSVersion = reader.GetString(reader.GetOrdinal("OSVersion")),
                                    OSIsSecure = reader.GetBoolean(reader.GetOrdinal("OSIsSecure")),
                                    KnownVulnerabilities = reader.GetString(reader.GetOrdinal("KnownVulnerabilities")),
                                    EducationalContentSecurity = reader.GetString(reader.GetOrdinal("EducationalContentSecurity")),
                                    UserAgeVerification = reader.GetString(reader.GetOrdinal("UserAgeVerification")),
                                    DeviceMonitoringCapabilities = reader.GetBoolean(reader.GetOrdinal("DeviceMonitoringCapabilities")),
                                    RemoteManagement = reader.GetBoolean(reader.GetOrdinal("RemoteManagement")),
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

        public async Task<List<EducationalDevice>> GetAllEducationalDevicesAsync()
        {
            List<EducationalDevice> devices = new List<EducationalDevice>();

            try
            {
                using (SqlConnection conn = new SqlConnection(ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("GetAllEducationalDeviceDetails", conn))
                    {
                        conn.Open();
                        cmd.CommandType = CommandType.StoredProcedure;

                        using (SqlDataReader reader = await cmd.ExecuteReaderAsync())
                        {
                            while (reader.Read())
                            {
                                devices.Add(new EducationalDevice
                                {
                                    EducationalDeviceID = reader.GetInt64(reader.GetOrdinal("EducationalDeviceID")),
                                    BrandName = reader.GetString(reader.GetOrdinal("BrandName")),
                                    DeviceModel = reader.GetString(reader.GetOrdinal("DeviceModel")),
                                    DeviceIsSecure = reader.GetString(reader.GetOrdinal("DeviceIsSecure")),
                                    OSVersion = reader.GetString(reader.GetOrdinal("OSVersion")),
                                    OSIsSecure = reader.GetBoolean(reader.GetOrdinal("OSIsSecure")),
                                    KnownVulnerabilities = reader.GetString(reader.GetOrdinal("KnownVulnerabilities")),
                                    EducationalContentSecurity = reader.GetString(reader.GetOrdinal("EducationalContentSecurity")),
                                    UserAgeVerification = reader.GetString(reader.GetOrdinal("UserAgeVerification")),
                                    DeviceMonitoringCapabilities = reader.GetBoolean(reader.GetOrdinal("DeviceMonitoringCapabilities")),
                                    RemoteManagement = reader.GetBoolean(reader.GetOrdinal("RemoteManagement")),
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
