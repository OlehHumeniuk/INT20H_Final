using Microsoft.CodeAnalysis;
using System;
using Newtonsoft.Json;

namespace Server_Test_SignalR.Entieis.DeviseTypes
{
    public class ComputingDevice : Device
    {
        public long ComputingDeviceID { get; set; }
        public string DeviceModel { get; set; }
        public int RAMSize { get; set; }
        public int StorageSize { get; set; }
        public bool HasAntivirus { get; set; }

        public override void PrintDeviceInfo()
        {
            base.PrintDeviceInfo();
            Console.WriteLine($"Computing Device ID: {ComputingDeviceID}");
            Console.WriteLine($"DeviceModel: {DeviceModel}");
            Console.WriteLine($"RAM Size: {RAMSize} GB");
            Console.WriteLine($"Storage Size: {StorageSize} GB");
            Console.WriteLine($"Has Antivirus: {(HasAntivirus ? "Yes" : "No")}");
        }
    }
}

