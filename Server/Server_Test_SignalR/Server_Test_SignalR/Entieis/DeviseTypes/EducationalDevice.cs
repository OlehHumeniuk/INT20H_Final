namespace Server_Test_SignalR.Entieis.DeviseTypes
{
    public class EducationalDevice : Device
    {
        public long EducationalDeviceID { get; set; }
        public string EducationalContentSecurity { get; set; }
        public string UserAgeVerification { get; set; }
        public bool DeviceMonitoringCapabilities { get; set; }
        public bool RemoteManagement { get; set; }

        public override void PrintDeviceInfo()
        {
            base.PrintDeviceInfo();
            Console.WriteLine($"Educational Device ID: {EducationalDeviceID}");
            Console.WriteLine($"Educational Content Security: {EducationalContentSecurity}");
            Console.WriteLine($"User Age Verification: {UserAgeVerification}");
            Console.WriteLine($"Device Monitoring Capabilities: {(DeviceMonitoringCapabilities ? "Yes" : "No")}");
            Console.WriteLine($"Remote Management: {(RemoteManagement ? "Yes" : "No")}");
        }
    }
}
