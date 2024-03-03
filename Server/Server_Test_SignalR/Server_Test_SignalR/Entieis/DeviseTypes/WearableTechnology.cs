namespace Server_Test_SignalR.Entieis.DeviseTypes
{
    public class WearableTechnology : Device
    {
        public long WearableTechnologyID { get; set; }
        public string BiometricDataSecurity { get; set; }
        public string DevicePairingSecurity { get; set; }
        public string LocationTrackingOption { get; set; }
        public bool EmergencySOS { get; set; }

        public override void PrintDeviceInfo()
        {
            base.PrintDeviceInfo();
            Console.WriteLine($"Wearable Technology ID: {WearableTechnologyID}");
            Console.WriteLine($"Biometric Data Security: {BiometricDataSecurity}");
            Console.WriteLine($"Device Pairing Security: {DevicePairingSecurity}");
            Console.WriteLine($"Location Tracking Option: {LocationTrackingOption}");
            Console.WriteLine($"Emergency SOS: {(EmergencySOS ? "Yes" : "No")}");
        }
    }
}
