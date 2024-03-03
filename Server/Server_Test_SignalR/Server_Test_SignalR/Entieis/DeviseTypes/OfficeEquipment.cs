namespace Server_Test_SignalR.Entieis.DeviseTypes
{
    public class OfficeEquipment : Device
    {
        public long OfficeEquipmentID { get; set; }
        public string NetworkConnectivity { get; set; }
        public string DocumentSecurityFeatures { get; set; }
        public string UserAuthentication { get; set; }
        public string AccessLogs { get; set; }

        public override void PrintDeviceInfo()
        {
            base.PrintDeviceInfo();
            Console.WriteLine($"Office Equipment ID: {OfficeEquipmentID}");
            Console.WriteLine($"Network Connectivity: {NetworkConnectivity}");
            Console.WriteLine($"Document Security Features: {DocumentSecurityFeatures}");
            Console.WriteLine($"User Authentication: {UserAuthentication}");
            Console.WriteLine($"Access Logs: {AccessLogs}");
        }
    }
}
