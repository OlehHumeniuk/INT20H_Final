using Microsoft.Data.SqlClient;
using Server_Test_SignalR.Entieis.DeviseTypes;
using System.Data;

namespace Server_Test_SignalR.DataLayer.DeviseTypesDL
{
    public class NetworkingEquipmentDL
    {
        public string ConnectionString = "Data Source=DESKTOP-ENJOGM8;Initial Catalog=INT20DB;Integrated Security=True; TrustServerCertificate=True";

        public async Task<NetworkingEquipment> GetNetworkingEquipmentDetailsAsync(long deviceId)
        {
            NetworkingEquipment device = null;

            try
            {
                using (SqlConnection conn = new SqlConnection(ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("GetNetworkingEquipmentDetails", conn))
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
                                // Отримуємо рядок SignalTypes з reader
                                string signalTypesString = reader.GetString(reader.GetOrdinal("SignalTypes"));

                                // Розділяємо рядок на окремі значення за допомогою коми
                                string[] signalTypesArray = signalTypesString.Split(',');

                                // Перетворюємо масив рядків на список
                                List<string> signalTypesList = signalTypesArray.ToList();

                                device = new NetworkingEquipment
                                {
                                    NetworkingEquipmentID = reader.GetInt64(reader.GetOrdinal("NetworkingEquipmentID")),
                                    BrandName = reader.GetString(reader.GetOrdinal("BrandName")),
                                    DeviceModel = reader.GetString(reader.GetOrdinal("DeviceModel")),
                                    DeviceIsSecure = reader.GetString(reader.GetOrdinal("DeviceIsSecure")),
                                    OSVersion = reader.GetString(reader.GetOrdinal("OSVersion")),
                                    OSIsSecure = reader.GetBoolean(reader.GetOrdinal("OSIsSecure")),
                                    KnownVulnerabilities = reader.GetString(reader.GetOrdinal("KnownVulnerabilities")),
                                    SupportsVPN = reader.GetBoolean(reader.GetOrdinal("SupportsVPN")),
                                    MaxDataRate = reader.GetInt32(reader.GetOrdinal("MaxDataRate")),
                                    PortCount = reader.GetInt32(reader.GetOrdinal("PortCount")),
                                    FirewallCapabilities = reader.GetString(reader.GetOrdinal("FirewallCapabilities")),
                                    DeviceImagePath = reader.GetString(reader.GetOrdinal("DeviceImagePath")),
                                    SignalTypes = signalTypesList  // Додаємо список типів сигналів
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

        public async Task<List<NetworkingEquipment>> GetAllNetworkingEquipmentAsync()
        {
            List<NetworkingEquipment> devices = new List<NetworkingEquipment>();

            try
            {
                using (SqlConnection conn = new SqlConnection(ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("GetAllNetworkingEquipmentDetails", conn))
                    {
                        conn.Open();
                        cmd.CommandType = CommandType.StoredProcedure;

                        using (SqlDataReader reader = await cmd.ExecuteReaderAsync())
                        {
                            while (reader.Read())
                            {
                                devices.Add(new NetworkingEquipment
                                {
                                    NetworkingEquipmentID = reader.GetInt64(reader.GetOrdinal("NetworkingEquipmentID")),
                                    BrandName = reader.GetString(reader.GetOrdinal("BrandName")),
                                    DeviceID = reader.GetInt64(reader.GetOrdinal("DeviceID")),
                                    DeviceModel = reader.GetString(reader.GetOrdinal("DeviceModel")),
                                    DeviceIsSecure = reader.GetString(reader.GetOrdinal("DeviceIsSecure")),
                                    OSVersion = reader.GetString(reader.GetOrdinal("OSVersion")),
                                    OSIsSecure = reader.GetBoolean(reader.GetOrdinal("OSIsSecure")),
                                    KnownVulnerabilities = reader.GetString(reader.GetOrdinal("KnownVulnerabilities")),
                                    SupportsVPN = reader.GetBoolean(reader.GetOrdinal("SupportsVPN")),
                                    MaxDataRate = reader.GetInt32(reader.GetOrdinal("MaxDataRate")),
                                    PortCount = reader.GetInt32(reader.GetOrdinal("PortCount")),
                                    FirewallCapabilities = reader.GetString(reader.GetOrdinal("FirewallCapabilities")),
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
