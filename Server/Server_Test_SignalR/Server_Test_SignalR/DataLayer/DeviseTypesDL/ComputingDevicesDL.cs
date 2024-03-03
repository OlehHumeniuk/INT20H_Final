using Microsoft.Data.SqlClient;
using Server_Test_SignalR.Entieis;
using Server_Test_SignalR.Entieis.DeviseTypes;
using System.Data;

namespace Server_Test_SignalR.DataLayer.DeviseTypesDL
{
    public class ComputingDevicesDL
    {
        public string ConnectionString = "Data Source=DESKTOP-ENJOGM8;Initial Catalog=INT20DB;Integrated Security=True; TrustServerCertificate=True";
        public async Task<ComputingDevice> GetComputingDeviceDetailsAsync(long pDeviceId)
        {
            ComputingDevice device = null;
            try
            {
                using (SqlConnection conn = new SqlConnection(ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("GetComputingDeviceDetails", conn))
                    {
                        conn.Open();
                        cmd.CommandType = CommandType.StoredProcedure;
                        SqlParameter DeviceId = new SqlParameter("@DeviceId", SqlDbType.BigInt); // Переконайтеся, що назва параметру відповідає назві у процедурі
                        DeviceId.Value = pDeviceId;
                        cmd.Parameters.Add(DeviceId);

                        using (SqlDataReader reader = await cmd.ExecuteReaderAsync())
                        {
                            if (reader.Read())
                            {
                                device = new ComputingDevice
                                {
                                    ComputingDeviceID = reader.GetInt64(reader.GetOrdinal("ComputingDeviceID")),
                                    BrandName = reader.GetString(reader.GetOrdinal("BrandName")),
                                    DeviceModel = reader.GetString(reader.GetOrdinal("DeviceModel")),
                                    DeviceImagePath = reader.GetString(reader.GetOrdinal("DeviceImagePath")),
                                    DeviceIsSecure = reader.GetString(reader.GetOrdinal("DeviceIsSecure")),
                                    OSVersion = reader.GetString(reader.GetOrdinal("OSVersion")),
                                    OSIsSecure = reader.GetBoolean(reader.GetOrdinal("OSIsSecure")),
                                    KnownVulnerabilities = reader.GetString(reader.GetOrdinal("KnownVulnerabilities")),
                                    RAMSize = reader.GetInt32(reader.GetOrdinal("RAMSize")),
                                    StorageSize = reader.GetInt32(reader.GetOrdinal("StorageSize")),
                                    HasAntivirus = reader.GetBoolean(reader.GetOrdinal("HasAntivirus"))
                                };
                            }
                        }
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                // Обробляйте помилку тут. Наприклад, виведіть повідомлення про помилку в консоль або журнал.
                Console.WriteLine($"An error occurred: {ex.Message}");
            }

            return device;
        }
        public async Task<List<ComputingDevice>> GetAllComputingDevicesAsync()
        {
            List<ComputingDevice> devices = new List<ComputingDevice>();

            try
            {
                using (SqlConnection conn = new SqlConnection(ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("GetAllComputingDevices", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        conn.Open();
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

                                devices.Add(new ComputingDevice
                                {
                                    ComputingDeviceID = reader.GetInt64(reader.GetOrdinal("ComputingDeviceID")),
                                    DeviceID = reader.GetInt64(reader.GetOrdinal("DeviceID")),
                                    BrandName = reader.GetString(reader.GetOrdinal("BrandName")),
                                    DeviceModel = reader.GetString(reader.GetOrdinal("DeviceModel")),
                                    DeviceIsSecure = reader.GetString(reader.GetOrdinal("DeviceIsSecure")),
                                    OSVersion = reader.GetString(reader.GetOrdinal("OSVersion")),
                                    OSIsSecure = reader.GetBoolean(reader.GetOrdinal("OSIsSecure")),
                                    KnownVulnerabilities = reader.GetString(reader.GetOrdinal("KnownVulnerabilities")),
                                    RAMSize = reader.GetInt32(reader.GetOrdinal("RAMSize")),
                                    StorageSize = reader.GetInt32(reader.GetOrdinal("StorageSize")),
                                    HasAntivirus = reader.GetBoolean(reader.GetOrdinal("HasAntivirus")),
                                    DeviceImagePath = reader.GetString(reader.GetOrdinal("DeviceImagePath")),
                                    SignalTypes = signalTypesList  // Додаємо список типів сигналів
                                });
                            }
                        }

                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                // Обробляйте помилку тут. Наприклад, виведіть повідомлення про помилку в консоль або журнал.
                Console.WriteLine($"An error occurred: {ex.Message}");
            }

            return devices;
        }

    }
}
