using Microsoft.Data.SqlClient;
using Server_Test_SignalR.Entieis.DeviseTypes;
using System.Data;

namespace Server_Test_SignalR.DataLayer.DeviseTypesDL
{
    public class MobileDeviceDL
    {
        public string ConnectionString = "Data Source=DESKTOP-ENJOGM8;Initial Catalog=INT20DB;Integrated Security=True; TrustServerCertificate=True";

        public async Task<MobileDevice> GetMobileDeviceDetailsAsync(long deviceId)
        {
            MobileDevice device = null;

            try
            {
                using (SqlConnection conn = new SqlConnection(ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("GetMobileDeviceDetails", conn))
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
                                device = new MobileDevice
                                {
                                    MobileDeviceID = reader.GetInt64(reader.GetOrdinal("MobileDeviceID")),
                                    BrandName = reader.GetString(reader.GetOrdinal("BrandName")),
                                    DeviceModel = reader.GetString(reader.GetOrdinal("DeviceModel")),
                                    DeviceIsSecure = reader.GetString(reader.GetOrdinal("DeviceIsSecure")),
                                    OSVersion = reader.GetString(reader.GetOrdinal("OSVersion")),
                                    OSIsSecure = reader.GetBoolean(reader.GetOrdinal("OSIsSecure")),
                                    KnownVulnerabilities = reader.GetString(reader.GetOrdinal("KnownVulnerabilities")),
                                    ScreenSize = reader.GetDecimal(reader.GetOrdinal("ScreenSize")),
                                    BatteryLife = reader.GetInt32(reader.GetOrdinal("BatteryLife")),
                                    BiometricSecurity = reader.GetBoolean(reader.GetOrdinal("BiometricSecurity")),
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

        // Додайте методи GetAutomotiveDeviceDetailsAsync, GetIoTDeviceDetailsAsync та GetIndustrialControlSystemDetailsAsync
        // для отримання даних про відповідні пристрої з бази даних.

        public async Task<List<MobileDevice>> GetAllMobileDevicesAsync()
        {
            List<MobileDevice> devices = new List<MobileDevice>();

            try
            {
                using (SqlConnection conn = new SqlConnection(ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("GetAllMobileDeviceDetails", conn))
                    {
                        conn.Open();
                        cmd.CommandType = CommandType.StoredProcedure;

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

                                devices.Add(new MobileDevice
                                {
                                    MobileDeviceID = reader.GetInt64(reader.GetOrdinal("MobileDeviceID")),
                                    BrandName = reader.GetString(reader.GetOrdinal("BrandName")),
                                    DeviceModel = reader.GetString(reader.GetOrdinal("DeviceModel")),
                                    DeviceIsSecure = reader.GetString(reader.GetOrdinal("DeviceIsSecure")),
                                    OSVersion = reader.GetString(reader.GetOrdinal("OSVersion")),
                                    OSIsSecure = reader.GetBoolean(reader.GetOrdinal("OSIsSecure")),
                                    KnownVulnerabilities = reader.GetString(reader.GetOrdinal("KnownVulnerabilities")),
                                    ScreenSize = reader.GetDecimal(reader.GetOrdinal("ScreenSize")),
                                    BatteryLife = reader.GetInt32(reader.GetOrdinal("BatteryLife")),
                                    BiometricSecurity = reader.GetBoolean(reader.GetOrdinal("BiometricSecurity")),
                                    DeviceImagePath = reader.GetString(reader.GetOrdinal("DeviceImagePath")),
                                    SignalTypes = signalTypesList  // Додаємо список типів сигналів
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