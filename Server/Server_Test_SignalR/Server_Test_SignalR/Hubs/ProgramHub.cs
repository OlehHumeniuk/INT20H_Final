using Microsoft.AspNetCore.SignalR;
using System.Threading.Tasks;
using System;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using Microsoft.Data.SqlClient;
using System.Data;
using Server_Test_SignalR.Entieis.DeviseTypes;
using Server_Test_SignalR.DataLayer.DeviseTypesDL;
using Newtonsoft.Json;
using Server_Test_SignalR.Entieis;
using Server_Test_SignalR.DataLayer;


namespace Server_Test_SignalR.Hubs
{
    public class ProgramHub : Hub
    {

        private readonly AutomotiveDevicesDL _automotiveDevicesDL;
        private readonly ComputingDevicesDL _computingDevicesDL;
        private readonly EducationalDeviceDL _educationalDeviceDL;
        private readonly EntertainmentSystemDL _entertainmentSystemDL;
        private readonly HealthcareDeviceDL _healthcareDeviceDL;
        private readonly IndustrialControlSystemDL _industrialControlSystemDL;
        private readonly IoTDeviceDL _ioTDeviceDL;
        private readonly NetworkingEquipmentDL _networkingEquipmentDL;
        private readonly OfficeEquipmentDL _officeEquipmentDL;
        private readonly SmartHomeDeviceDL _smartHomeDeviceDL;
        private readonly WearableTechnologyDL _wearableTechnologyDL;

        public ProgramHub(
            AutomotiveDevicesDL automotiveDevicesDL,
            ComputingDevicesDL computingDevicesDL,
            EducationalDeviceDL educationalDeviceDL,
            EntertainmentSystemDL entertainmentSystemDL,
            HealthcareDeviceDL healthcareDeviceDL,
            IndustrialControlSystemDL industrialControlSystemDL,
            IoTDeviceDL ioTDeviceDL,
            NetworkingEquipmentDL networkingEquipmentDL,
            OfficeEquipmentDL officeEquipmentDL,
            SmartHomeDeviceDL smartHomeDeviceDL,
            WearableTechnologyDL wearableTechnologyDL)
        {
            _automotiveDevicesDL = automotiveDevicesDL;
            _computingDevicesDL = computingDevicesDL;
            _educationalDeviceDL = educationalDeviceDL;
            _entertainmentSystemDL = entertainmentSystemDL;
            _healthcareDeviceDL = healthcareDeviceDL;
            _industrialControlSystemDL = industrialControlSystemDL;
            _ioTDeviceDL = ioTDeviceDL;
            _networkingEquipmentDL = networkingEquipmentDL;
            _officeEquipmentDL = officeEquipmentDL;
            _smartHomeDeviceDL = smartHomeDeviceDL;
            _wearableTechnologyDL = wearableTechnologyDL;
        }

        public async Task GetAllDeviceTypes()
        {
            var DeviceTypesDl = Context.GetHttpContext().RequestServices.GetService<DeviceTypesDL>();

            List<DeviceTypes> deviceTypes = await DeviceTypesDl.GetAllDeviceTypesAsync();
            if (deviceTypes != null && deviceTypes.Any())
            {
                string deviceTypesJson = JsonConvert.SerializeObject(deviceTypes);
                await Clients.Caller.SendAsync("ReceiveAllDeviceTypes", deviceTypesJson);
            }
            else
            {
                await Clients.Caller.SendAsync("ReceiveAllDeviceTypes", "[]"); // Пустий масив JSON, якщо пристроїв не знайдено
            }
        }

        public async Task GetAllDevices()
        {
            var devicesDl = Context.GetHttpContext().RequestServices.GetService<DevicesDL>();

            List<Device> deviceTypes = await devicesDl.GetAllDevicesAsync();
            if (deviceTypes != null && deviceTypes.Any())
            {
                string deviceTypesJson = JsonConvert.SerializeObject(deviceTypes);
                await Clients.Caller.SendAsync("ReceiveAllDevices", deviceTypesJson);
            }
            else
            {
                await Clients.Caller.SendAsync("ReceiveAllDevices", "[]"); // Пустий масив JSON, якщо пристроїв не знайдено
            }
        }
        //BrandsDL
        public async Task GetAllBrands()
        {
            var brandsDl = Context.GetHttpContext().RequestServices.GetService<BrandsDL>();

            List<String> deviceTypes = await brandsDl.GetAllBrandsAsync();
            if (deviceTypes != null && deviceTypes.Any())
            {
                string deviceTypesJson = JsonConvert.SerializeObject(deviceTypes);
                await Clients.Caller.SendAsync("ReceiveAllBrands", deviceTypesJson);
            }
            else
            {
                await Clients.Caller.SendAsync("ReceiveAllBrands", "[]"); // Пустий масив JSON, якщо пристроїв не знайдено
            }
        }
        public async Task GetAutomotiveDeviceInfo(string pAutomotiveDeviceId)
        {
            var automotiveDeviceDl = Context.GetHttpContext().RequestServices.GetService<AutomotiveDevicesDL>();

            AutomotiveDevice automotiveDevice = await automotiveDeviceDl.GetAutomotiveDeviceDetailsAsync(Convert.ToInt64(pAutomotiveDeviceId));
            if (automotiveDevice != null)
            {
                string automotiveDeviceJson = automotiveDevice.ToJson();
                await Clients.Caller.SendAsync("ReceiveAutomotiveDeviceInfo", automotiveDeviceJson);
            }
            else
            {
                await Clients.Caller.SendAsync("ReceiveAutomotiveDeviceInfo", "{}"); // Пустий JSON, якщо користувач не знайдений
            }
        }

        public async Task GetAllAutomotiveDevices()
        {
            var automotiveDeviceDl = Context.GetHttpContext().RequestServices.GetService<AutomotiveDevicesDL>();

            List<AutomotiveDevice> automotiveDevices = await automotiveDeviceDl.GetAllAutomotiveDevicesAsync();
            if (automotiveDevices != null && automotiveDevices.Any())
            {
                string automotiveDevicesJson = JsonConvert.SerializeObject(automotiveDevices);
                await Clients.Caller.SendAsync("ReceiveAllAutomotiveDevices", automotiveDevicesJson);
            }
            else
            {
                await Clients.Caller.SendAsync("ReceiveAllAutomotiveDevices", "[]"); // Пустий масив JSON, якщо пристроїв не знайдено
            }
        }

        public async Task GetComputingDeviceInfo(string pСomputingDeviceId)
        {
            // Використовуємо IServiceProvider для отримання ComputingDevicesDL
            var computingDeviceDl = Context.GetHttpContext().RequestServices.GetService<ComputingDevicesDL>();

            ComputingDevice lComputingDevice = await computingDeviceDl.GetComputingDeviceDetailsAsync(Convert.ToInt64(pСomputingDeviceId));
            if (lComputingDevice != null)
            {
                String lComputingDeviceJson = lComputingDevice.ToJson();
                await Clients.Caller.SendAsync("ReceiveComputingDeviceInfo", lComputingDeviceJson);
            }
            else
            {
                await Clients.Caller.SendAsync("ReceiveComputingDeviceInfo", "{}"); // Пустий JSON, якщо користувач не знайдений
            }
        }

        public async Task GetAllComputingDevices()
        {
            var computingDeviceDl = Context.GetHttpContext().RequestServices.GetService<ComputingDevicesDL>();

            List<ComputingDevice> computingDevices = await computingDeviceDl.GetAllComputingDevicesAsync();
            if (computingDevices != null && computingDevices.Any())
            {
                string computingDevicesJson = JsonConvert.SerializeObject(computingDevices);
                await Clients.Caller.SendAsync("ReceiveAllComputingDevices", computingDevicesJson);
            }
            else
            {
                await Clients.Caller.SendAsync("ReceiveAllComputingDevices", "[]"); // Пустий масив JSON, якщо пристроїв не знайдено
            }
        }

        // Для класу EducationalDeviceDL
        public async Task GetEducationalDeviceInfo(string pEducationalDeviceId)
        {
            var educationalDeviceDl = Context.GetHttpContext().RequestServices.GetService<EducationalDeviceDL>();

            EducationalDevice educationalDevice = await educationalDeviceDl.GetEducationalDeviceDetailsAsync(Convert.ToInt64(pEducationalDeviceId));
            if (educationalDevice != null)
            {
                string educationalDeviceJson = educationalDevice.ToJson();
                await Clients.Caller.SendAsync("ReceiveEducationalDeviceInfo", educationalDeviceJson);
            }
            else
            {
                await Clients.Caller.SendAsync("ReceiveEducationalDeviceInfo", "{}"); // Пустий JSON, якщо пристрій не знайдено
            }
        }

        public async Task GetAllEducationalDevices()
        {
            var educationalDeviceDl = Context.GetHttpContext().RequestServices.GetService<EducationalDeviceDL>();

            List<EducationalDevice> educationalDevices = await educationalDeviceDl.GetAllEducationalDevicesAsync();
            if (educationalDevices != null && educationalDevices.Any())
            {
                string educationalDevicesJson = JsonConvert.SerializeObject(educationalDevices);
                await Clients.Caller.SendAsync("ReceiveAllEducationalDevices", educationalDevicesJson);
            }
            else
            {
                await Clients.Caller.SendAsync("ReceiveAllEducationalDevices", "[]"); // Пустий масив JSON, якщо пристроїв не знайдено
            }
        }

        // Для класу EntertainmentSystemDL
        public async Task GetEntertainmentSystemInfo(string pEntertainmentSystemId)
        {
            var entertainmentSystemDl = Context.GetHttpContext().RequestServices.GetService<EntertainmentSystemDL>();

            EntertainmentSystem entertainmentSystem = await entertainmentSystemDl.GetEntertainmentSystemDetailsAsync(Convert.ToInt64(pEntertainmentSystemId));
            if (entertainmentSystem != null)
            {
                string entertainmentSystemJson = entertainmentSystem.ToJson();
                await Clients.Caller.SendAsync("ReceiveEntertainmentSystemInfo", entertainmentSystemJson);
            }
            else
            {
                await Clients.Caller.SendAsync("ReceiveEntertainmentSystemInfo", "{}"); // Пустий JSON, якщо пристрій не знайдено
            }
        }

        public async Task GetAllEntertainmentSystems()
        {
            var entertainmentSystemDl = Context.GetHttpContext().RequestServices.GetService<EntertainmentSystemDL>();

            List<EntertainmentSystem> entertainmentSystems = await entertainmentSystemDl.GetAllEntertainmentSystemsAsync();
            if (entertainmentSystems != null && entertainmentSystems.Any())
            {
                string entertainmentSystemsJson = JsonConvert.SerializeObject(entertainmentSystems);
                await Clients.Caller.SendAsync("ReceiveAllEntertainmentSystems", entertainmentSystemsJson);
            }
            else
            {
                await Clients.Caller.SendAsync("ReceiveAllEntertainmentSystems", "[]"); // Пустий масив JSON, якщо пристроїв не знайдено
            }
        }

        // Для класу HealthcareDeviceDL
        public async Task GetHealthcareDeviceInfo(string pHealthcareDeviceId)
        {
            var healthcareDeviceDl = Context.GetHttpContext().RequestServices.GetService<HealthcareDeviceDL>();

            HealthcareDevice healthcareDevice = await healthcareDeviceDl.GetHealthcareDeviceDetailsAsync(Convert.ToInt64(pHealthcareDeviceId));
            if (healthcareDevice != null)
            {
                string healthcareDeviceJson = healthcareDevice.ToJson();
                await Clients.Caller.SendAsync("ReceiveHealthcareDeviceInfo", healthcareDeviceJson);
            }
            else
            {
                await Clients.Caller.SendAsync("ReceiveHealthcareDeviceInfo", "{}"); // Пустий JSON, якщо пристрій не знайдено
            }
        }

        public async Task GetAllHealthcareDevices()
        {
            var healthcareDeviceDl = Context.GetHttpContext().RequestServices.GetService<HealthcareDeviceDL>();

            List<HealthcareDevice> healthcareDevices = await healthcareDeviceDl.GetAllHealthcareDevicesAsync();
            if (healthcareDevices != null && healthcareDevices.Any())
            {
                string healthcareDevicesJson = JsonConvert.SerializeObject(healthcareDevices);
                await Clients.Caller.SendAsync("ReceiveAllHealthcareDevices", healthcareDevicesJson);
            }
            else
            {
                await Clients.Caller.SendAsync("ReceiveAllHealthcareDevices", "[]"); // Пустий масив JSON, якщо пристроїв не знайдено
            }
        }

        // Для класу IndustrialControlSystemDL
        public async Task GetIndustrialControlSystemInfo(string pIndustrialControlSystemId)
        {
            var industrialControlSystemDl = Context.GetHttpContext().RequestServices.GetService<IndustrialControlSystemDL>();

            IndustrialControlSystem industrialControlSystem = await industrialControlSystemDl.GetIndustrialControlSystemDetailsAsync(Convert.ToInt64(pIndustrialControlSystemId));
            if (industrialControlSystem != null)
            {
                string industrialControlSystemJson = industrialControlSystem.ToJson();
                await Clients.Caller.SendAsync("ReceiveIndustrialControlSystemInfo", industrialControlSystemJson);
            }
            else
            {
                await Clients.Caller.SendAsync("ReceiveIndustrialControlSystemInfo", "{}"); // Пустий JSON, якщо пристрій не знайдено
            }
        }

        public async Task GetAllIndustrialControlSystems()
        {
            var industrialControlSystemDl = Context.GetHttpContext().RequestServices.GetService<IndustrialControlSystemDL>();

            List<IndustrialControlSystem> industrialControlSystems = await industrialControlSystemDl.GetAllIndustrialControlSystemsAsync();
            if (industrialControlSystems != null && industrialControlSystems.Any())
            {
                string industrialControlSystemsJson = JsonConvert.SerializeObject(industrialControlSystems);
                await Clients.Caller.SendAsync("ReceiveAllIndustrialControlSystems", industrialControlSystemsJson);
            }
            else
            {
                await Clients.Caller.SendAsync("ReceiveAllIndustrialControlSystems", "[]"); // Пустий масив JSON, якщо пристроїв не знайдено
            }
        }

        // Для класу IoTDeviceDL
        public async Task GetIoTDeviceInfo(string pIoTDeviceId)
        {
            var ioTDeviceDl = Context.GetHttpContext().RequestServices.GetService<IoTDeviceDL>();

            IoTDevice ioTDevice = await ioTDeviceDl.GetIoTDeviceDetailsAsync(Convert.ToInt64(pIoTDeviceId));
            if (ioTDevice != null)
            {
                string ioTDeviceJson = ioTDevice.ToJson();
                await Clients.Caller.SendAsync("ReceiveIoTDeviceInfo", ioTDeviceJson);
            }
            else
            {
                await Clients.Caller.SendAsync("ReceiveIoTDeviceInfo", "{}"); // Пустий JSON, якщо пристрій не знайдено
            }
        }

        public async Task GetAllIoTDevices()
        {
            var ioTDeviceDl = Context.GetHttpContext().RequestServices.GetService<IoTDeviceDL>();

            List<IoTDevice> ioTDevices = await ioTDeviceDl.GetAllIoTDevicesAsync();
            if (ioTDevices != null && ioTDevices.Any())
            {
                string ioTDevicesJson = JsonConvert.SerializeObject(ioTDevices);
                await Clients.Caller.SendAsync("ReceiveAllIoTDevices", ioTDevicesJson);
            }
            else
            {
                await Clients.Caller.SendAsync("ReceiveAllIoTDevices", "[]"); // Пустий масив JSON, якщо пристроїв не знайдено
            }
        }

        // Для класу MobileDeviceDL
        public async Task GetMobileDeviceInfo(string pMobileDeviceId)
        {
            var mobileDeviceDl = Context.GetHttpContext().RequestServices.GetService<MobileDeviceDL>();

            MobileDevice mobileDevice = await mobileDeviceDl.GetMobileDeviceDetailsAsync(Convert.ToInt64(pMobileDeviceId));
            if (mobileDevice != null)
            {
                string mobileDeviceJson = mobileDevice.ToJson();
                await Clients.Caller.SendAsync("ReceiveMobileDeviceInfo", mobileDeviceJson);
            }
            else
            {
                await Clients.Caller.SendAsync("ReceiveMobileDeviceInfo", "{}"); // Пустий JSON, якщо пристрій не знайдено
            }
        }



        public async Task GetAllMobileDevices()
        {
            var mobileDeviceDl = Context.GetHttpContext().RequestServices.GetService<MobileDeviceDL>();

            List<MobileDevice> mobileDevices = await mobileDeviceDl.GetAllMobileDevicesAsync();
            if (mobileDevices != null && mobileDevices.Any())
            {
                string mobileDevicesJson = JsonConvert.SerializeObject(mobileDevices);
                await Clients.Caller.SendAsync("ReceiveAllMobileDevices", mobileDevicesJson);
            }
            else
            {
                await Clients.Caller.SendAsync("ReceiveAllMobileDevices", "[]"); // Пустий масив JSON, якщо пристроїв не знайдено
            }
        }

        // Для класу NetworkingEquipmentDL
        public async Task GetNetworkingEquipmentInfo(string pNetworkingEquipmentId)
        {
            var networkingEquipmentDl = Context.GetHttpContext().RequestServices.GetService<NetworkingEquipmentDL>();

            NetworkingEquipment networkingEquipment = await networkingEquipmentDl.GetNetworkingEquipmentDetailsAsync(Convert.ToInt64(pNetworkingEquipmentId));
            if (networkingEquipment != null)
            {
                string networkingEquipmentJson = networkingEquipment.ToJson();
                await Clients.Caller.SendAsync("ReceiveNetworkingEquipmentInfo", networkingEquipmentJson);
            }
            else
            {
                await Clients.Caller.SendAsync("ReceiveNetworkingEquipmentInfo", "{}"); // Пустий JSON, якщо пристрій не знайдено
            }
        }

        public async Task GetAllNetworkingEquipment()
        {
            var networkingEquipmentDl = Context.GetHttpContext().RequestServices.GetService<NetworkingEquipmentDL>();

            List<NetworkingEquipment> networkingEquipments = await networkingEquipmentDl.GetAllNetworkingEquipmentAsync();
            if (networkingEquipments != null && networkingEquipments.Any())
            {
                string networkingEquipmentsJson = JsonConvert.SerializeObject(networkingEquipments);
                await Clients.Caller.SendAsync("ReceiveAllNetworkingEquipment", networkingEquipmentsJson);
            }
            else
            {
                await Clients.Caller.SendAsync("ReceiveAllNetworkingEquipment", "[]"); // Пустий масив JSON, якщо пристроїв не знайдено
            }
        }

        // Для класу OfficeEquipmentDL
        public async Task GetOfficeEquipmentInfo(string pOfficeEquipmentId)
        {
            var officeEquipmentDl = Context.GetHttpContext().RequestServices.GetService<OfficeEquipmentDL>();

            OfficeEquipment officeEquipment = await officeEquipmentDl.GetOfficeEquipmentDetailsAsync(Convert.ToInt64(pOfficeEquipmentId));
            if (officeEquipment != null)
            {
                string officeEquipmentJson = officeEquipment.ToJson();
                await Clients.Caller.SendAsync("ReceiveOfficeEquipmentInfo", officeEquipmentJson);
            }
            else
            {
                await Clients.Caller.SendAsync("ReceiveOfficeEquipmentInfo", "{}"); // Пустий JSON, якщо пристрій не знайдено
            }
        }

        public async Task GetAllOfficeEquipment()
        {
            var officeEquipmentDl = Context.GetHttpContext().RequestServices.GetService<OfficeEquipmentDL>();

            List<OfficeEquipment> officeEquipments = await officeEquipmentDl.GetAllOfficeEquipmentAsync();
            if (officeEquipments != null && officeEquipments.Any())
            {
                string officeEquipmentsJson = JsonConvert.SerializeObject(officeEquipments);
                await Clients.Caller.SendAsync("ReceiveAllOfficeEquipment", officeEquipmentsJson);
            }
            else
            {
                await Clients.Caller.SendAsync("ReceiveAllOfficeEquipment", "[]"); // Пустий масив JSON, якщо пристроїв не знайдено
            }
        }

        // Для класу SmartHomeDeviceDL
        public async Task GetSmartHomeDeviceInfo(string pSmartHomeDeviceId)
        {
            var smartHomeDeviceDl = Context.GetHttpContext().RequestServices.GetService<SmartHomeDeviceDL>();

            SmartHomeDevice smartHomeDevice = await smartHomeDeviceDl.GetSmartHomeDeviceDetailsAsync(Convert.ToInt64(pSmartHomeDeviceId));
            if (smartHomeDevice != null)
            {
                string smartHomeDeviceJson = smartHomeDevice.ToJson();
                await Clients.Caller.SendAsync("ReceiveSmartHomeDeviceInfo", smartHomeDeviceJson);
            }
            else
            {
                await Clients.Caller.SendAsync("ReceiveSmartHomeDeviceInfo", "{}"); // Пустий JSON, якщо пристрій не знайдено
            }
        }

        public async Task GetAllSmartHomeDevices()
        {
            var smartHomeDeviceDl = Context.GetHttpContext().RequestServices.GetService<SmartHomeDeviceDL>();

            List<SmartHomeDevice> smartHomeDevices = await smartHomeDeviceDl.GetAllSmartHomeDevicesAsync();
            if (smartHomeDevices != null && smartHomeDevices.Any())
            {
                string smartHomeDevicesJson = JsonConvert.SerializeObject(smartHomeDevices);
                await Clients.Caller.SendAsync("ReceiveAllSmartHomeDevices", smartHomeDevicesJson);
            }
            else
            {
                await Clients.Caller.SendAsync("ReceiveAllSmartHomeDevices", "[]"); // Пустий масив JSON, якщо пристроїв не знайдено
            }
        }

        // Для класу WearableTechnologyDL
        public async Task GetWearableTechnologyInfo(string pWearableTechnologyId)
        {
            var wearableTechnologyDl = Context.GetHttpContext().RequestServices.GetService<WearableTechnologyDL>();

            WearableTechnology wearableTechnology = await wearableTechnologyDl.GetWearableTechnologyDetailsAsync(Convert.ToInt64(pWearableTechnologyId));
            if (wearableTechnology != null)
            {
                string wearableTechnologyJson = wearableTechnology.ToJson();
                await Clients.Caller.SendAsync("ReceiveWearableTechnologyInfo", wearableTechnologyJson);
            }
            else
            {
                await Clients.Caller.SendAsync("ReceiveWearableTechnologyInfo", "{}"); // Пустий JSON, якщо пристрій не знайдено
            }
        }

        public async Task GetAllWearableTechnologies()
        {
            var wearableTechnologyDl = Context.GetHttpContext().RequestServices.GetService<WearableTechnologyDL>();

            List<WearableTechnology> wearableTechnologies = await wearableTechnologyDl.GetAllWearableTechnologiesAsync();
            if (wearableTechnologies != null && wearableTechnologies.Any())
            {
                string wearableTechnologiesJson = JsonConvert.SerializeObject(wearableTechnologies);
                await Clients.Caller.SendAsync("ReceiveAllWearableTechnologies", wearableTechnologiesJson);
            }
            else
            {
                await Clients.Caller.SendAsync("ReceiveAllWearableTechnologies", "[]"); // Пустий масив JSON, якщо пристроїв не знайдено
            }
        }

    }
}
