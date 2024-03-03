using Microsoft.Data.SqlClient;
using Server_Test_SignalR.Entieis.DeviseTypes;
using System.Data;

namespace Server_Test_SignalR.DataLayer.DeviseTypesDL
{
    public class HealthcareDeviceDL
    {
        public string ConnectionString = "Data Source=DESKTOP-ENJOGM8;Initial Catalog=INT20DB;Integrated Security=True; TrustServerCertificate=True";

        public async Task<HealthcareDevice> GetHealthcareDeviceDetailsAsync(long deviceId)
        {
            HealthcareDevice device = null;

            try
            {
                using (SqlConnection conn = new SqlConnection(ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("GetHealthcareDeviceDetails", conn))
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
                                device = new HealthcareDevice
                                {
                                    HealthcareDeviceID = reader.GetInt64(reader.GetOrdinal("HealthcareDeviceID")),
                                    BrandName = reader.GetString(reader.GetOrdinal("BrandName")),
                                    DeviceModel = reader.GetString(reader.GetOrdinal("DeviceModel")),
                                    DeviceIsSecure = reader.GetString(reader.GetOrdinal("DeviceIsSecure")),
                                    OSVersion = reader.GetString(reader.GetOrdinal("OSVersion")),
                                    OSIsSecure = reader.GetBoolean(reader.GetOrdinal("OSIsSecure")),
                                    KnownVulnerabilities = reader.GetString(reader.GetOrdinal("KnownVulnerabilities")),
                                    PatientDataSecurity = reader.GetString(reader.GetOrdinal("PatientDataSecurity")),
                                    RegulatoryCompliance = reader.GetString(reader.GetOrdinal("RegulatoryCompliance")),
                                    DataEncryptionLevel = reader.GetString(reader.GetOrdinal("DataEncryptionLevel")),
                                    EmergencySupport = reader.GetBoolean(reader.GetOrdinal("EmergencySupport")),
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

        public async Task<List<HealthcareDevice>> GetAllHealthcareDevicesAsync()
        {
            List<HealthcareDevice> devices = new List<HealthcareDevice>();

            try
            {
                using (SqlConnection conn = new SqlConnection(ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("GetAllHealthcareDeviceDetails", conn))
                    {
                        conn.Open();
                        cmd.CommandType = CommandType.StoredProcedure;

                        using (SqlDataReader reader = await cmd.ExecuteReaderAsync())
                        {
                            while (reader.Read())
                            {
                                devices.Add(new HealthcareDevice
                                {
                                    HealthcareDeviceID = reader.GetInt64(reader.GetOrdinal("HealthcareDeviceID")),
                                    BrandName = reader.GetString(reader.GetOrdinal("BrandName")),
                                    DeviceModel = reader.GetString(reader.GetOrdinal("DeviceModel")),
                                    DeviceIsSecure = reader.GetString(reader.GetOrdinal("DeviceIsSecure")),
                                    OSVersion = reader.GetString(reader.GetOrdinal("OSVersion")),
                                    OSIsSecure = reader.GetBoolean(reader.GetOrdinal("OSIsSecure")),
                                    KnownVulnerabilities = reader.GetString(reader.GetOrdinal("KnownVulnerabilities")),
                                    PatientDataSecurity = reader.GetString(reader.GetOrdinal("PatientDataSecurity")),
                                    RegulatoryCompliance = reader.GetString(reader.GetOrdinal("RegulatoryCompliance")),
                                    DataEncryptionLevel = reader.GetString(reader.GetOrdinal("DataEncryptionLevel")),
                                    EmergencySupport = reader.GetBoolean(reader.GetOrdinal("EmergencySupport")),
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
