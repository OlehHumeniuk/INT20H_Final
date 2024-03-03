-- First drop tables that have foreign keys to other tables.
DROP TABLE IF EXISTS AutomotiveDevices;
DROP TABLE IF EXISTS IoTDevices;
DROP TABLE IF EXISTS IndustrialControlSystems;
DROP TABLE IF EXISTS HealthcareDevices;
DROP TABLE IF EXISTS EducationalDevices;
DROP TABLE IF EXISTS WearableTechnology;
DROP TABLE IF EXISTS EntertainmentSystems;
DROP TABLE IF EXISTS OfficeEquipment;
DROP TABLE IF EXISTS SmartHomeDevices;
DROP TABLE IF EXISTS NetworkingEquipment;
DROP TABLE IF EXISTS MobileDevices;
DROP TABLE IF EXISTS ComputingDevices;
DROP TABLE IF EXISTS DeviceSignalTypes;

-- Then drop the Devices table which these tables reference.
DROP TABLE IF EXISTS Devices;
DROP TABLE IF EXISTS DeviceTypes;

-- Now you can drop the tables that Devices had foreign keys to.
DROP TABLE IF EXISTS OperatingSystems;
DROP TABLE IF EXISTS OperatingSystemsTypes;
DROP TABLE IF EXISTS SignalTypes;
DROP TABLE IF EXISTS EncryptionTypes;
DROP TABLE IF EXISTS TransmissionProtocols;
DROP TABLE IF EXISTS Brands;

-- Finally, you can drop the Languages table, ensuring no other tables reference it.
DROP TABLE IF EXISTS Genders;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Languages;

DROP PROCEDURE IF EXISTS GetAllNetworkingEquipmentDetails;