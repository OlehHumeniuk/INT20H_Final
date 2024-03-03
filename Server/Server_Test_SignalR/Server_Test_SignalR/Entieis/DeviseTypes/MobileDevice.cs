using Microsoft.CodeAnalysis;
using System;
using Newtonsoft.Json;

namespace Server_Test_SignalR.Entieis.DeviseTypes
{
    public class MobileDevice : Device
    {
        public long MobileDeviceID { get; set; }
        public decimal ScreenSize { get; set; }
        public int BatteryLife { get; set; }
        public bool BiometricSecurity { get; set; }

        public override void PrintDeviceInfo()
        {
            base.PrintDeviceInfo();
            Console.WriteLine($"Mobile Device ID: {MobileDeviceID}");
            Console.WriteLine($"Screen Size: {ScreenSize}");
            Console.WriteLine($"Battery Life: {BatteryLife}");
            Console.WriteLine($"Biometric Security: {(BiometricSecurity ? "Yes" : "No")}");
        }
    }
}
