using Microsoft.Data.SqlClient;
using Server_Test_SignalR.Entieis.DeviseTypes;
using System.Data;

namespace Server_Test_SignalR.DataLayer.DeviseTypesDL
{
    public class AutomotiveDevicesDL
    {
        public string ConnectionString = "Data Source=DESKTOP-ENJOGM8;Initial Catalog=INT20DB;Integrated Security=True; TrustServerCertificate=True";

        public async Task<AutomotiveDevice> GetAutomotiveDeviceDetailsAsync(long deviceId)
        {
            AutomotiveDevice device = null;

            try
            {
                using (SqlConnection conn = new SqlConnection(ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("GetAutomotiveDeviceDetails", conn))
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
                                device = new AutomotiveDevice
                                {
                                    AutomotiveDeviceID = reader.GetInt64(reader.GetOrdinal("AutomotiveDeviceID")),
                                    BrandName = reader.GetString(reader.GetOrdinal("BrandName")),
                                    DeviceModel = reader.GetString(reader.GetOrdinal("DeviceModel")),
                                    DeviceIsSecure = reader.GetString(reader.GetOrdinal("DeviceIsSecure")),
                                    OSVersion = reader.GetString(reader.GetOrdinal("OSVersion")),
                                    OSIsSecure = reader.GetBoolean(reader.GetOrdinal("OSIsSecure")),
                                    KnownVulnerabilities = reader.GetString(reader.GetOrdinal("KnownVulnerabilities")),
                                    VehicleCybersecurity = reader.GetString(reader.GetOrdinal("VehicleCybersecurity")),
                                    TelematicsFeatures = reader.GetString(reader.GetOrdinal("TelematicsFeatures")),
                                    ECUSecurity = reader.GetString(reader.GetOrdinal("ECUSecurity")),
                                    OverTheAirUpdates = reader.GetBoolean(reader.GetOrdinal("OverTheAirUpdates")),
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

        public async Task<List<AutomotiveDevice>> GetAllAutomotiveDevicesAsync()
        {
            List<AutomotiveDevice> devices = new List<AutomotiveDevice>();

            try
            {
                using (SqlConnection conn = new SqlConnection(ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("GetAllAutomotiveDeviceDetails", conn))
                    {
                        conn.Open();
                        cmd.CommandType = CommandType.StoredProcedure;

                        using (SqlDataReader reader = await cmd.ExecuteReaderAsync())
                        {
                            while (reader.Read())
                            {
                                devices.Add(new AutomotiveDevice
                                {
                                    AutomotiveDeviceID = reader.GetInt64(reader.GetOrdinal("AutomotiveDeviceID")),
                                    BrandName = reader.GetString(reader.GetOrdinal("BrandName")),
                                    DeviceModel = reader.GetString(reader.GetOrdinal("DeviceModel")),
                                    DeviceIsSecure = reader.GetString(reader.GetOrdinal("DeviceIsSecure")),
                                    OSVersion = reader.GetString(reader.GetOrdinal("OSVersion")),
                                    OSIsSecure = reader.GetBoolean(reader.GetOrdinal("OSIsSecure")),
                                    KnownVulnerabilities = reader.GetString(reader.GetOrdinal("KnownVulnerabilities")),
                                    VehicleCybersecurity = reader.GetString(reader.GetOrdinal("VehicleCybersecurity")),
                                    TelematicsFeatures = reader.GetString(reader.GetOrdinal("TelematicsFeatures")),
                                    ECUSecurity = reader.GetString(reader.GetOrdinal("ECUSecurity")),
                                    OverTheAirUpdates = reader.GetBoolean(reader.GetOrdinal("OverTheAirUpdates")),
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
