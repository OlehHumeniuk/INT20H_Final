namespace Server_Test_SignalR.Entieis.DeviseTypes
{
    public class IoTDevice : Device
    {
        public long IoTDeviceID { get; set; }
        public string IoTSecurity { get; set; }
        public string ConnectivityProtocols { get; set; }
        public string UpdateMechanism { get; set; }
        public string DataCollectionPolicy { get; set; }

        public override void PrintDeviceInfo()
        {
            base.PrintDeviceInfo();
            Console.WriteLine($"IoT Device ID: {IoTDeviceID}");
            Console.WriteLine($"IoT Security: {IoTSecurity}");
            Console.WriteLine($"Connectivity Protocols: {ConnectivityProtocols}");
            Console.WriteLine($"Update Mechanism: {UpdateMechanism}");
            Console.WriteLine($"Data Collection Policy: {DataCollectionPolicy}");
        }
    }
}
