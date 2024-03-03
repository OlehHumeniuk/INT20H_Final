namespace Server_Test_SignalR.Entieis.DeviseTypes
{
    public class HealthcareDevice : Device
    {
        public long HealthcareDeviceID { get; set; }
        public string PatientDataSecurity { get; set; }
        public string RegulatoryCompliance { get; set; }
        public string DataEncryptionLevel { get; set; }
        public bool EmergencySupport { get; set; }

        public override void PrintDeviceInfo()
        {
            base.PrintDeviceInfo();
            Console.WriteLine($"Healthcare Device ID: {HealthcareDeviceID}");
            Console.WriteLine($"Patient Data Security: {PatientDataSecurity}");
            Console.WriteLine($"Regulatory Compliance: {RegulatoryCompliance}");
            Console.WriteLine($"Data Encryption Level: {DataEncryptionLevel}");
            Console.WriteLine($"Emergency Support: {(EmergencySupport ? "Yes" : "No")}");
        }
    }
}
