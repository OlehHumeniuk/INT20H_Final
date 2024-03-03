using Microsoft.Data.SqlClient;
using Server_Test_SignalR.Entieis.DeviseTypes;
using System.Data;

namespace Server_Test_SignalR.DataLayer.DeviseTypesDL
{
    public class IoTDeviceDL
    {
        public string ConnectionString = "Data Source=DESKTOP-ENJOGM8;Initial Catalog=INT20DB;Integrated Security=True; TrustServerCertificate=True";

        public async Task<IoTDevice> GetIoTDeviceDetailsAsync(long deviceId)
        {
            IoTDevice device = null;

            try
            {
                using (SqlConnection conn = new SqlConnection(ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("GetIoTDeviceDetails", conn))
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
                                device = new IoTDevice
                                {
                                    IoTDeviceID = reader.GetInt64(reader.GetOrdinal("IoTDevicesID")),
                                    BrandName = reader.GetString(reader.GetOrdinal("BrandName")),
                                    DeviceModel = reader.GetString(reader.GetOrdinal("DeviceModel")),
                                    DeviceIsSecure = reader.GetString(reader.GetOrdinal("DeviceIsSecure")),
                                    OSVersion = reader.GetString(reader.GetOrdinal("OSVersion")),
                                    OSIsSecure = reader.GetBoolean(reader.GetOrdinal("OSIsSecure")),
                                    KnownVulnerabilities = reader.GetString(reader.GetOrdinal("KnownVulnerabilities")),
                                    IoTSecurity = reader.GetString(reader.GetOrdinal("IoTSecurity")),
                                    ConnectivityProtocols = reader.GetString(reader.GetOrdinal("ConnectivityProtocols")),
                                    UpdateMechanism = reader.GetString(reader.GetOrdinal("UpdateMechanism")),
                                    DataCollectionPolicy = reader.GetString(reader.GetOrdinal("DataCollectionPolicy")),
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

        public async Task<List<IoTDevice>> GetAllIoTDevicesAsync()
        {
            List<IoTDevice> devices = new List<IoTDevice>();

            try
            {
                using (SqlConnection conn = new SqlConnection(ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("GetAllIoTDeviceDetails", conn))
                    {
                        conn.Open();
                        cmd.CommandType = CommandType.StoredProcedure;

                        using (SqlDataReader reader = await cmd.ExecuteReaderAsync())
                        {
                            while (reader.Read())
                            {
                                devices.Add(new IoTDevice
                                {
                                    IoTDeviceID = reader.GetInt64(reader.GetOrdinal("IoTDevicesID")),
                                    BrandName = reader.GetString(reader.GetOrdinal("BrandName")),
                                    DeviceModel = reader.GetString(reader.GetOrdinal("DeviceModel")),
                                    DeviceIsSecure = reader.GetString(reader.GetOrdinal("DeviceIsSecure")),
                                    OSVersion = reader.GetString(reader.GetOrdinal("OSVersion")),
                                    OSIsSecure = reader.GetBoolean(reader.GetOrdinal("OSIsSecure")),
                                    KnownVulnerabilities = reader.GetString(reader.GetOrdinal("KnownVulnerabilities")),
                                    IoTSecurity = reader.GetString(reader.GetOrdinal("IoTSecurity")),
                                    ConnectivityProtocols = reader.GetString(reader.GetOrdinal("ConnectivityProtocols")),
                                    UpdateMechanism = reader.GetString(reader.GetOrdinal("UpdateMechanism")),
                                    DataCollectionPolicy = reader.GetString(reader.GetOrdinal("DataCollectionPolicy")),
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
