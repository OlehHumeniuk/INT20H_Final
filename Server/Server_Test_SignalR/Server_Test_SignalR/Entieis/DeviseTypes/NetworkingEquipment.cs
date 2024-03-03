namespace Server_Test_SignalR.Entieis.DeviseTypes
{
    public class NetworkingEquipment : Device
    {
        public long NetworkingEquipmentID { get; set; }
        public bool SupportsVPN { get; set; }
        public int MaxDataRate { get; set; }
        public int PortCount { get; set; }
        public string FirewallCapabilities { get; set; }

        public override void PrintDeviceInfo()
        {
            base.PrintDeviceInfo();
            Console.WriteLine($"Networking Equipment ID: {NetworkingEquipmentID}");
            Console.WriteLine($"Supports VPN: {(SupportsVPN ? "Yes" : "No")}");
            Console.WriteLine($"Max Data Rate: {MaxDataRate}");
            Console.WriteLine($"Port Count: {PortCount}");
            Console.WriteLine($"Firewall Capabilities: {FirewallCapabilities}");
        }
    }
}
