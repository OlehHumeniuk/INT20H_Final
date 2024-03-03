using Newtonsoft.Json;
using System.Security.Cryptography;

namespace Server_Test_SignalR.Entieis
{
    public class DeviceTypes
    {
        public long DeviceTypeID { get; set; }
        public string DeviceTypeName { get; set; }
        public string ImagePath { get; set; }

        public virtual void PrintDeviceInfo()
        {
            Console.WriteLine($"DeviceType ID: {DeviceTypeID}");
            Console.WriteLine($"DeviceType Name: {DeviceTypeName}");
            Console.WriteLine($"Image Path: {ImagePath}");
        }

        public string ToJson()
        {
            return JsonConvert.SerializeObject(this, Formatting.Indented);
        }
    }
}
