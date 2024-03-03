namespace Server_Test_SignalR.Entieis.DeviseTypes
{
    public class SmartHomeDevice : Device
    {
        public long SmartHomeDevicesID { get; set; }
        public string ConnectivityType { get; set; }
        public string CompatibleAssistants { get; set; }
        public bool EnergyStarRated { get; set; }
        public bool RemoteAccess { get; set; }

        public override void PrintDeviceInfo()
        {
            base.PrintDeviceInfo();
            Console.WriteLine($"Smart Home Device ID: {SmartHomeDevicesID}");
            Console.WriteLine($"Connectivity Type: {ConnectivityType}");
            Console.WriteLine($"Compatible Assistants: {CompatibleAssistants}");
            Console.WriteLine($"Energy Star Rated: {(EnergyStarRated ? "Yes" : "No")}");
            Console.WriteLine($"Remote Access: {(RemoteAccess ? "Yes" : "No")}");
        }
    }
}
