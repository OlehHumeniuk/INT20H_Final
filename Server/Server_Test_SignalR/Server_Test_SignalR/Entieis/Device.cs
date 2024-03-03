using Newtonsoft.Json;
using System;

namespace Server_Test_SignalR.Entieis
{
    public class Device
    {
        public Int64 DeviceID { get; set; }
        public Int64 OSID { get; set; }
        public string BrandName { get; set; }
        public string DeviceIsSecure { get; set; }
        public string OSVersion { get; set; }
        public bool OSIsSecure { get; set; }
        public string KnownVulnerabilities { get; set; }
        public string DeviceModel { get; set; }
        public string DeviceImagePath { get; set; }
        public List<string> SignalTypes { get; set; }

        public virtual void PrintDeviceInfo()
        {
            Console.WriteLine($"Device ID: {DeviceID}");
            Console.WriteLine($"Device Model: {DeviceModel}");
            Console.WriteLine($"OS ID: {OSID}");
            Console.WriteLine($"Brand Name: {BrandName}");
            Console.WriteLine($"Device Is Secure: {DeviceIsSecure}");
            Console.WriteLine($"OS Version: {OSVersion}");
            Console.WriteLine($"OS Is Secure: {(OSIsSecure ? "Yes" : "No")}");
            Console.WriteLine($"Known Vulnerabilities: {KnownVulnerabilities}");
            Console.WriteLine($"Device Image Path: {DeviceImagePath}");
        }

        public string ToJson()
        {
            return JsonConvert.SerializeObject(this, Formatting.Indented);
        }
    }
}
