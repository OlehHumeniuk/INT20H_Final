using Microsoft.Data.SqlClient;
using Server_Test_SignalR.Entieis.DeviseTypes;
using System.Data;

namespace Server_Test_SignalR.DataLayer.DeviseTypesDL
{
    public class SmartHomeDeviceDL
    {
        public string ConnectionString = "Data Source=DESKTOP-ENJOGM8;Initial Catalog=INT20DB;Integrated Security=True; TrustServerCertificate=True";

        public async Task<SmartHomeDevice> GetSmartHomeDeviceDetailsAsync(long deviceId)
        {
            SmartHomeDevice device = null;

            try
            {
                using (SqlConnection conn = new SqlConnection(ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("GetSmartHomeDeviceDetails", conn))
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
                                device = new SmartHomeDevice
                                {
                                    SmartHomeDevicesID = reader.GetInt64(reader.GetOrdinal("SmartHomeDevicesID")),
                                    BrandName = reader.GetString(reader.GetOrdinal("BrandName")),
                                    DeviceModel = reader.GetString(reader.GetOrdinal("DeviceModel")),
                                    DeviceIsSecure = reader.GetString(reader.GetOrdinal("DeviceIsSecure")),
                                    OSVersion = reader.GetString(reader.GetOrdinal("OSVersion")),
                                    OSIsSecure = reader.GetBoolean(reader.GetOrdinal("OSIsSecure")),
                                    KnownVulnerabilities = reader.GetString(reader.GetOrdinal("KnownVulnerabilities")),
                                    ConnectivityType = reader.GetString(reader.GetOrdinal("ConnectivityType")),
                                    CompatibleAssistants = reader.GetString(reader.GetOrdinal("CompatibleAssistants")),
                                    EnergyStarRated = reader.GetBoolean(reader.GetOrdinal("EnergyStarRated")),
                                    RemoteAccess = reader.GetBoolean(reader.GetOrdinal("RemoteAccess")),
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

        public async Task<List<SmartHomeDevice>> GetAllSmartHomeDevicesAsync()
        {
            List<SmartHomeDevice> devices = new List<SmartHomeDevice>();

            try
            {
                using (SqlConnection conn = new SqlConnection(ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("GetAllSmartHomeDeviceDetails", conn))
                    {
                        conn.Open();
                        cmd.CommandType = CommandType.StoredProcedure;

                        using (SqlDataReader reader = await cmd.ExecuteReaderAsync())
                        {
                            while (reader.Read())
                            {
                                devices.Add(new SmartHomeDevice
                                {
                                    SmartHomeDevicesID = reader.GetInt64(reader.GetOrdinal("SmartHomeDevicesID")),
                                    BrandName = reader.GetString(reader.GetOrdinal("BrandName")),
                                    DeviceModel = reader.GetString(reader.GetOrdinal("DeviceModel")),
                                    DeviceIsSecure = reader.GetString(reader.GetOrdinal("DeviceIsSecure")),
                                    OSVersion = reader.GetString(reader.GetOrdinal("OSVersion")),
                                    OSIsSecure = reader.GetBoolean(reader.GetOrdinal("OSIsSecure")),
                                    KnownVulnerabilities = reader.GetString(reader.GetOrdinal("KnownVulnerabilities")),
                                    ConnectivityType = reader.GetString(reader.GetOrdinal("ConnectivityType")),
                                    CompatibleAssistants = reader.GetString(reader.GetOrdinal("CompatibleAssistants")),
                                    EnergyStarRated = reader.GetBoolean(reader.GetOrdinal("EnergyStarRated")),
                                    RemoteAccess = reader.GetBoolean(reader.GetOrdinal("RemoteAccess")),
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
