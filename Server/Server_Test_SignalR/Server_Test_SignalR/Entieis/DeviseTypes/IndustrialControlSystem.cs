namespace Server_Test_SignalR.Entieis.DeviseTypes
{
    public class IndustrialControlSystem : Device
    {
        public long IndustrialControlSystemID { get; set; }
        public string SCADASecurity { get; set; }
        public string PhysicalSafetyFeatures { get; set; }
        public bool NetworkIsolation { get; set; }
        public bool RegularUpdatesSupport { get; set; }

        public override void PrintDeviceInfo()
        {
            base.PrintDeviceInfo();
            Console.WriteLine($"Industrial Control System ID: {IndustrialControlSystemID}");
            Console.WriteLine($"SCADA Security: {SCADASecurity}");
            Console.WriteLine($"Physical Safety Features: {PhysicalSafetyFeatures}");
            Console.WriteLine($"Network Isolation: {(NetworkIsolation ? "Yes" : "No")}");
            Console.WriteLine($"Regular Updates Support: {(RegularUpdatesSupport ? "Yes" : "No")}");
        }
    }
}
