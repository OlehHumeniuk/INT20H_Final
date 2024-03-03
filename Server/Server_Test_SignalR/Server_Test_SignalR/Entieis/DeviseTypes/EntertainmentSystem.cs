namespace Server_Test_SignalR.Entieis.DeviseTypes
{
    public class EntertainmentSystem : Device
    {
        public long EntertainmentSystemID { get; set; }
        public string ParentalControl { get; set; }
        public bool FirmwareIntegrityCheck { get; set; }
        public string NetworkSecurity { get; set; }
        public string ContentEncryption { get; set; }

        public override void PrintDeviceInfo()
        {
            base.PrintDeviceInfo();
            Console.WriteLine($"Entertainment System ID: {EntertainmentSystemID}");
            Console.WriteLine($"Parental Control: {ParentalControl}");
            Console.WriteLine($"Firmware Integrity Check: {(FirmwareIntegrityCheck ? "Yes" : "No")}");
            Console.WriteLine($"Network Security: {NetworkSecurity}");
            Console.WriteLine($"Content Encryption: {ContentEncryption}");
        }
    }
}
