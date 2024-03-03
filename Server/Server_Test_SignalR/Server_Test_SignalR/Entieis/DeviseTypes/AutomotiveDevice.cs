namespace Server_Test_SignalR.Entieis.DeviseTypes
{
    public class AutomotiveDevice : Device
    {
        public long AutomotiveDeviceID { get; set; }
        public string VehicleCybersecurity { get; set; }
        public string TelematicsFeatures { get; set; }
        public string ECUSecurity { get; set; }
        public bool OverTheAirUpdates { get; set; }

        public override void PrintDeviceInfo()
        {
            base.PrintDeviceInfo();
            Console.WriteLine($"Automotive Device ID: {AutomotiveDeviceID}");
            Console.WriteLine($"Vehicle Cybersecurity: {VehicleCybersecurity}");
            Console.WriteLine($"Telematics Features: {TelematicsFeatures}");
            Console.WriteLine($"ECU Security: {ECUSecurity}");
            Console.WriteLine($"Over-the-Air Updates: {(OverTheAirUpdates ? "Yes" : "No")}");
        }
    }
}
